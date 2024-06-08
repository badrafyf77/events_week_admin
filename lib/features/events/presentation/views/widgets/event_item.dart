import 'package:events_week_admin/features/events/presentation/views/widgets/event_circle_time.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_details.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EventCercleTime(),
        EventDetails(),
      ],
    );
  }
}
