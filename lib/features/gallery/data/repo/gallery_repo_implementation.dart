import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/core/utils/services/firestorage_service.dart';
import 'package:events_week_admin/core/utils/services/firestore_service.dart';
import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:events_week_admin/features/gallery/data/repo/gallery_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class GalleryRepoImplementation implements GalleryRepo {
  final FirestorageService _firestorageService;
  final FirestoreService _firestoreService;

  GalleryRepoImplementation(this._firestorageService, this._firestoreService);

  @override
  Future<Either<Failure, List<Gallery>>> getGalleries() async {
    try {
      var galleriesList = await _firestoreService.getGalleries();
      return right(galleriesList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addGallery(String title, XFile? image) async {
    try {
      var id = const Uuid().v4();
      String downloadUrl;
      if (image != null) {
        File selectedImagePath = File(image.path);
        downloadUrl = await _firestorageService.uploadFile(
            selectedImagePath, _firestorageService.galleriesFolderName, title);
      } else {
        return left(PickImageFailure(errMessage: 'choisir une image'));
      }
      Gallery gallery = Gallery(
        id: id,
        title: title,
        downloadUrl: downloadUrl,
      );
      await _firestoreService.addGallery(gallery);
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
  Future<Either<Failure, Unit>> deleteGallery(Gallery gallery) async {
    try {
      await _firestoreService.deleteGallery(gallery);
      await _firestorageService.deleteFile(
          _firestorageService.galleriesFolderName, gallery.title);
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
  Future<Either<Failure, Unit>> updateGallery(
      Gallery gallery, String oldTitle, bool oldImage, XFile? image) async {
    try {
      String downloadUrl;
      if (!oldImage) {
        if (image != null) {
          await _firestorageService.deleteFile(
              _firestorageService.galleriesFolderName, oldTitle);
          File selectedImagePath = File(image.path);
          downloadUrl = await _firestorageService.uploadFile(selectedImagePath,
              _firestorageService.galleriesFolderName, gallery.title);
        } else {
          return left(PickImageFailure(errMessage: 'choisir une image'));
        }
      } else {
        downloadUrl = await _firestorageService.updateFile(
            oldTitle, _firestorageService.galleriesFolderName, gallery.title);
      }
      Gallery g = Gallery(
        id: gallery.id,
        title: gallery.title,
        downloadUrl: downloadUrl,
      );
      await _firestoreService.updateGallery(g);
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
