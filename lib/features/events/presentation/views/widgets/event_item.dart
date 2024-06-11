import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_circle_time.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_details.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key, required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EventCercleTime(
          date: event.date,
        ),
        EventDetails(
          event: event,
        ),
      ],
    );
  }
}
