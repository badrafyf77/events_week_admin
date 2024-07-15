import 'package:events_week_admin/features/activities/presentation/views/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ActivitiesBody extends StatelessWidget {
  const ActivitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const ActivityCard();
          },
        ),
      ),
    );
  }
}
