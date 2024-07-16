import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/add_activity_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';

class AddActivityView extends StatelessWidget {
  const AddActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigateBackIcon(
            title: 'Ajouter une activité',
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.activities);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const AddActivityBody(),
        ],
      ),
    );
  }
}