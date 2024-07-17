import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/features/activities/data/model/activity_model.dart';
import 'package:events_week_admin/features/activities/presentation/views/widgets/edit_activity_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';

class EditActivityView extends StatelessWidget {
  const EditActivityView({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigateBackIcon(
            title: "Éditer l'activité xxxxx",
            onPressed: () {
              AppRouter.navigateTo(context, AppRouter.activities);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          EditActivityBody(
            activity: activity,
          ),
        ],
      ),
    );
  }
}
