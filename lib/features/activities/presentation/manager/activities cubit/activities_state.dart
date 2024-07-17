part of 'activities_cubit.dart';

sealed class ActivitiesState {}

final class ActivitiesInitial extends ActivitiesState {}

final class ActivitiesLaoding extends ActivitiesState {}

final class ActivitiesSuccess extends ActivitiesState {
  final String msg;

  ActivitiesSuccess({required this.msg});
}

final class ActivitiesFailure extends ActivitiesState {
  final String err;

  ActivitiesFailure({required this.err});
}

final class GetActivitiesSuccess extends ActivitiesState {
  final List<Activity> activitiesList;

  GetActivitiesSuccess({required this.activitiesList});
}
