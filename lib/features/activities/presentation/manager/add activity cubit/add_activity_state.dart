part of 'add_activity_cubit.dart';

sealed class AddActivityState {}

final class AddActivityInitial extends AddActivityState {}

final class AddActivityLaoding extends AddActivityState {}

final class AddActivitySuccess extends AddActivityState {}

final class AddActivityFailure extends AddActivityState {
  final String err;

  AddActivityFailure({required this.err});
}