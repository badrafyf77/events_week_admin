import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/events/presentation/manager/get%20events%20cubit/get_events_cubit.dart';
import 'package:image_picker/image_picker.dart';

abstract class EventsRepo {
  Future<Either<Failure, Unit>> addEvent(String title, String description,
      String place, DateTime date, XFile? image);
  Future<Either<Failure, EventsInfo>> getEventsInfo();
  Future<Either<Failure, Unit>> setInitialEvent(Event event);
}
