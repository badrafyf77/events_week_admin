import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/utils/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, int>> countEvents();
}