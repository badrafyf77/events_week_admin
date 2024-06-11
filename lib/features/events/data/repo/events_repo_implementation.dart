import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/services/firestorage_service.dart';
import 'package:events_week_admin/core/services/firestore_service.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class EventsRepoImplementation implements EventsRepo {
  final FirestoreService _firestoreService;
  final FireStorageService _fireStorageService;

  EventsRepoImplementation(this._firestoreService, this._fireStorageService);

  @override
  Future<Either<Failure, Unit>> addEvent(Event event, XFile? image) async {
    try {
      if (image != null) {
        File selectedImagePath = File(image.path);
        await _fireStorageService.uploadFile(selectedImagePath, event.id);
      } else {
        return left(PickImageFailure(errMessage: 'choisir une image'));
      }
      await _firestoreService.addEvent(event);

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
