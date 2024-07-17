import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:events_week_admin/features/messages/data/model/message_model.dart';
import 'package:events_week_admin/core/utils/services/firestore_service.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/messages/data/repo/messages_repo.dart';

class MessagesRepoImplementation implements MessagesRepo {
  final FirestoreService _firestoreService;

  MessagesRepoImplementation(this._firestoreService);
  @override
  Future<Either<Failure, List<Message>>> getMessages() async {
    try {
      List<Message> messagesList = await _firestoreService.getMessages();
      return right(messagesList);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FirestoreFailure.fromFirestoreFailure(e));
      }
      return left(FirestoreFailure(
          errMessage: 'il y a une erreur, veuillez réessayer'));
    }
  }
  
  @override
  Future<Either<Failure, Unit>> changeMessageToReaded(String id) async{
    try {
      await _firestoreService.changeMessageToReaded(id);
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
  Future<Either<Failure, Unit>> deleteMessage(String id) async{
    try {
      await _firestoreService.deleteMessage(id);
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
