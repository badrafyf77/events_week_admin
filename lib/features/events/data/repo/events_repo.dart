import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:image_picker/image_picker.dart';

abstract class EventsRepo {
  Future<Either<Failure, Unit>> addEvent(String title, String description, String place, DateTime date, XFile? image);
}