import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/utils/services/firestore_service.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/home/data/model/events_week_info.dart';
import 'package:events_week_admin/features/home/data/repo/home_repo.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirestoreService _firestoreService;

  HomeRepoImplementation(this._firestoreService);

  @override
  Future<Either<Failure, EventsWeekInfo>> getEventsWeekInfo(
      DateTime date) async {
    try {
      int events = await _firestoreService.countEvents();
      int messages = await _firestoreService.countMessages();
      int activities = await _firestoreService.countActivities();
      int galleries = await _firestoreService.countGalleries();
      List visitsList =
          await _firestoreService.getVisitsList(date.month, date.year);
      int visitsToday = await _firestoreService.getTodayVisits();
      EventsWeekInfo eventsWeekInfo = EventsWeekInfo(
        events: events,
        messages: messages,
        activities: activities,
        galleries: galleries,
        visitsToday: visitsToday,
        visitsList: visitsList,
        date: date,
      );
      return right(eventsWeekInfo);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }
}
