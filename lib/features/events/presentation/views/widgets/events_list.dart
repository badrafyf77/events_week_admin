import 'package:events_week_admin/core/utils/customs/listview_builder.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_item.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  const EventsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: CustomListViewBuilder(
      itemCount: 4,
      widget: Column(
        children: [
          EventItem(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}
