import 'package:events_week_admin/features/events/data/model/event_model.dart';

class EventsInfo {
  final List<Event> eventsList;
  final Event initialEvent;

  EventsInfo({required this.eventsList, required this.initialEvent});
}