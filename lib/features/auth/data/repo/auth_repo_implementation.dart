import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/services/fireauth_service.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/auth/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImplementation implements AuthRepo {
  final FireauthService _fireauthService;

  AuthRepoImplementation(this._fireauthService);

  @override
  Future<Either<Failure, Unit>> signIn(String email, String password) async {
    try {
      bool result = await _fireauthService.signIn(email, password);
      if (result) {
        return right(unit);
      }
      return left(FirebaseAuthFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(FirebaseAuthFailure.fromFirebaseAuthException(e));
      }
      return left(FirebaseAuthFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }
}
