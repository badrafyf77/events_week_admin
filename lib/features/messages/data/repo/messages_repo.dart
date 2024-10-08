import 'package:dartz/dartz.dart';
import 'package:events_week_admin/features/messages/data/model/message_model.dart';
import 'package:events_week_admin/core/utils/failures.dart';

abstract class MessagesRepo {
  Future<Either<Failure, List<Message>>> getMessages();
  Future<Either<Failure, Unit>> changeMessageToReaded(String id);
  Future<Either<Failure, Unit>> deleteMessage(String id);
}
