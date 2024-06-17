part of 'get_events_week_info_cubit.dart';

@immutable
abstract class EventsWeekInfoState {}

final class EventsWeekInfoInitial extends EventsWeekInfoState {}

final class EventsWeekInfoLoading extends EventsWeekInfoState {}

final class EventsWeekInfoSuccess extends EventsWeekInfoState {
  final EventsWeekInfo eventsWeekInfo;

  EventsWeekInfoSuccess({required this.eventsWeekInfo});
}

final class EventsWeekInfoFailure extends EventsWeekInfoState {
  final String err;

  EventsWeekInfoFailure({required this.err});
}
