import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/features/events/presentation/views/widgets/event_info_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';

class EventInfoView extends StatelessWidget {
  const EventInfoView({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavigateBackIcon(
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.events);
          },
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              children: [
                EventPicture(downloadUrl: event.downloadUrl),
                EventInfoBody(event: event),
              ],
            ),
          ),
        )
      ],
    );
  }
}