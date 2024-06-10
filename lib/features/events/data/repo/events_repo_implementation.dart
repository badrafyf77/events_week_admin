import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/services/firestore_service.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo.dart';

class EventsRepoImplementation implements EventsRepo {
  final FirestoreService _firestoreService;

  EventsRepoImplementation(
    this._firestoreService,
  );

  @override
  Future<Either<Failure, Unit>> addEvent(Event event) async {
    try {
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
