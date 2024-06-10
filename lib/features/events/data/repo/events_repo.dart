import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/utils/failures.dart';

abstract class EventsRepo {
  Future<Either<Failure, Unit>> addEvent(Event event);
}