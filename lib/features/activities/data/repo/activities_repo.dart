import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/activities/data/model/activity_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ActivitiesRepo {
  Future<Either<Failure, Unit>> addActivity(String title, String description, XFile? image);
  Future<Either<Failure, Unit>> updateActivity(Activity activity, String oldTitle, bool oldImage, XFile? image);
  Future<Either<Failure, Unit>> deleteActivity(Activity activity);
}