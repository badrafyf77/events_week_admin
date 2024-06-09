import 'package:events_week_admin/features/events/presentation/views/widgets/add_event_header.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/add_event_left_side.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/add_event_right_side.dart';
import 'package:flutter/material.dart';

class AddEventView extends StatelessWidget {
  const AddEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddEventHeader(),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddEventLeftSide(),
              SizedBox(
                width: 20,
              ),
              AddEventRightSide(),
            ],
          ),
        ],
      ),
    );
  }
}
