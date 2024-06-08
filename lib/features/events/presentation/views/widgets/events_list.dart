import 'package:events_week_admin/core/utils/customs/listview_builder.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_item.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  const EventsList({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomListViewBuilder(
      itemCount: 4,
      widget: Column(
        children: [
          EventItem(width: width),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}
