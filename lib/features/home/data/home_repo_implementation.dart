import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/services/firestore_service.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/home/data/home_repo.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirestoreService _firestoreService;

  HomeRepoImplementation(this._firestoreService);
  
  @override
  Future<Either<Failure, int>> countEvents() async {
    try {
      int i = await _firestoreService.countEvents();
      return right(i);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }
}
