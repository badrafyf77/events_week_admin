import 'package:dartz/dartz.dart';
import 'package:events_week_admin/core/utils/failures.dart';
import 'package:events_week_admin/features/home/data/model/events_week_info.dart';

abstract class HomeRepo {
  Future<Either<Failure, EventsWeekInfo>> getEventsWeekInfo();
}