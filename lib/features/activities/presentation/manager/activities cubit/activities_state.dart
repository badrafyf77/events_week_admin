part of 'activities_cubit.dart';

sealed class ActivitiesState {}

final class ActivitiesInitial extends ActivitiesState {}

final class ActivitiesLaoding extends ActivitiesState {}

final class ActivitiesFailure extends ActivitiesState {
  final String err;

  ActivitiesFailure({required this.err});
}

final class AddActivitySuccess extends ActivitiesState {
  final String msg;

  AddActivitySuccess({required this.msg});
}

final class GetActivitiesSuccess extends ActivitiesState {
  final List<Activity> activitiesList;

  GetActivitiesSuccess({required this.activitiesList});
}

final class EditActivitySuccess extends ActivitiesState {
  final String msg;

  EditActivitySuccess({required this.msg});
}