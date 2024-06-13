import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/services/firestorage_service.dart';
import 'package:events_week_admin/core/services/firestore_service.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/events/data/model/events_info.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class EventsRepoImplementation implements EventsRepo {
  final FirestoreService _firestoreService;
  final FirestorageService _fireStorageService;

  EventsRepoImplementation(this._firestoreService, this._fireStorageService);

  @override
  Future<Either<Failure, Unit>> addEvent(String title, String description,
      String place, DateTime date, XFile? image) async {
    try {
      var id = const Uuid().v4();
      String downloadUrl;
      if (image != null) {
        File selectedImagePath = File(image.path);
        downloadUrl =
            await _fireStorageService.uploadFile(selectedImagePath, title);
      } else {
        return left(PickImageFailure(errMessage: 'choisir une image'));
      }
      Event event = Event(
        id: id,
        title: title,
        description: description,
        place: place,
        downloadUrl: downloadUrl,
        date: Timestamp.fromDate(date),
      );
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

  @override
  Future<Either<Failure, EventsInfo>> getEventsInfo() async {
    try {
      var eventsList = await _firestoreService.getEvents();
      var initialEvent = await _firestoreService.getInitialEvent();
      EventsInfo eventsInfo =
          EventsInfo(eventsList: eventsList, initialEvent: initialEvent);
      return right(eventsInfo);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> setInitialEvent(Event event) async {
    try {
      await _firestoreService.setInitialEvent(event);
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
