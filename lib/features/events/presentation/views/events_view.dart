import 'package:events_week_admin/features/events/presentation/views/widgets/events_list.dart';
import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            EventsList(
              width: constraints.maxWidth,
            ),
          ],
        );
      }),
    );
  }
}
