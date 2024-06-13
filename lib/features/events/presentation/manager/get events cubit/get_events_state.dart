part of 'get_events_cubit.dart';

@immutable
abstract class GetEventsState {}

final class GetEventsInitial extends GetEventsState {}

final class GetEventsLoading extends GetEventsState {}

final class GetEventsSuccess extends GetEventsState {
  final EventsInfo eventsInfo;

  GetEventsSuccess({required this.eventsInfo});
}

final class GetEventsFailure extends GetEventsState {
  final String err;

  GetEventsFailure({required this.err});
}

class EventsInfo {
  final List<Event> eventsList;
  final Event initialEvent;

  EventsInfo({required this.eventsList, required this.initialEvent});
}
