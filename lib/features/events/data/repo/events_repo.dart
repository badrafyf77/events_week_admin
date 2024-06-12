import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:image_picker/image_picker.dart';

abstract class EventsRepo {
  Future<Either<Failure, Unit>> addEvent(String title, String description, String place, DateTime date, XFile? image);
  Future<Either<Failure, List<Event>>> getEvents();
  Future<Either<Failure, Unit>> setInitialEvent(Event event);
}