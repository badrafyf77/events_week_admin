import 'package:events_week_admin/core/models/event_model.dart';

class EventsInfo {
  final List<Event> eventsList;
  final Event initialEvent;

  EventsInfo({required this.eventsList, required this.initialEvent});
}