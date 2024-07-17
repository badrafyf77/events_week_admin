import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/features/activities/data/model/activity_model.dart';
import 'package:flutter/material.dart';

class EditActivity extends StatelessWidget {
  const EditActivity({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          AppRouter.navigateToWithExtra(context, AppRouter.editActivity, activity);
        },
        icon: const Icon(
          Icons.edit,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
