import 'package:events_week_admin/features/events/presentation/views/widgets/event_item.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  const EventsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              EventItem(),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    ));
  }
}
