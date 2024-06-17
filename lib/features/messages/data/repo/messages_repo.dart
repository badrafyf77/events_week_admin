import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/models/message_model.dart';
import 'package:events_week_admin/core/utils/failures.dart';

abstract class MessagesRepo {
  Future<Either<Failure, List<Message>>> getMessages();
}
