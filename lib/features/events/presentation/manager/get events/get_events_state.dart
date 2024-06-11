part of 'get_events_cubit.dart';

@immutable
abstract class GetEventsState {}

final class GetEventsInitial extends GetEventsState {}

final class GetEventsLoading extends GetEventsState {}

final class GetEventsSuccess extends GetEventsState {
  final List<Event> eventsList;

  GetEventsSuccess({required this.eventsList});
}

final class GetEventsFailure extends GetEventsState {
  final String err;

  GetEventsFailure({required this.err});
}
