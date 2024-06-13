part of 'count_events_cubit.dart';

@immutable
abstract class CountEventsState {}

final class CountEventsInitial extends CountEventsState {}

final class CountEventsLoading extends CountEventsState {}

final class CountEventsSuccess extends CountEventsState {
  final int eventsNumber;

  CountEventsSuccess({required this.eventsNumber});
}

final class CountEventsFailure extends CountEventsState {
  final String err;

  CountEventsFailure({required this.err});
}
