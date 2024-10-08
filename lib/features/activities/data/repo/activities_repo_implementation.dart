import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/utils/services/firestorage_service.dart';
import 'package:events_week_admin/core/utils/services/firestore_service.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/activities/data/model/activity_model.dart';
import 'package:events_week_admin/features/activities/data/repo/activities_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ActivitiesRepoImplementation implements ActivitiesRepo {
  final FirestoreService _firestoreService;
  final FirestorageService _firestorageService;

  ActivitiesRepoImplementation(
      this._firestoreService, this._firestorageService);

  @override
  Future<Either<Failure, List<Activity>>> getActivities() async {
    try {
      var activitiesList = await _firestoreService.getActivities();
      return right(activitiesList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addActivity(
      String title, String description, XFile? image) async {
    try {
      var id = const Uuid().v4();
      String downloadUrl;
      if (image != null) {
        File selectedImagePath = File(image.path);
        downloadUrl = await _firestorageService.uploadFile(
            selectedImagePath, _firestorageService.activitiesFolderName, title);
      } else {
        return left(PickImageFailure(errMessage: 'choisir une image'));
      }
      Activity activity = Activity(
        id: id,
        title: title,
        description: description,
        downloadUrl: downloadUrl,
      );
      await _firestoreService.addActivity(activity);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteActivity(Activity activity) async {
    try {
      await _firestoreService.deleteActivity(activity);
      await _firestorageService.deleteFile(
          _firestorageService.activitiesFolderName, activity.title);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateActivity(
      Activity activity, String oldTitle, bool oldImage, XFile? image) async {
    try {
      String downloadUrl;
      if (!oldImage) {
        if (image != null) {
          await _firestorageService.deleteFile(
              _firestorageService.activitiesFolderName, oldTitle);
          File selectedImagePath = File(image.path);
          downloadUrl = await _firestorageService.uploadFile(selectedImagePath,
              _firestorageService.activitiesFolderName, activity.title);
        } else {
          return left(PickImageFailure(errMessage: 'choisir une image'));
        }
      } else {
        downloadUrl = await _firestorageService.updateFile(
            oldTitle, _firestorageService.activitiesFolderName, activity.title);
      }
      Activity a = Activity(
        id: activity.id,
        title: activity.title,
        description: activity.description,
        downloadUrl: downloadUrl,
      );
      await _firestoreService.updateActivity(a);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }
}
