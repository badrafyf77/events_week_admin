import 'package:events_week_admin/core/config/router.dart';
import 'package:flutter/material.dart';

class EditActivity extends StatelessWidget {
  const EditActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          AppRouter.navigateTo(context, AppRouter.editActivity);
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
