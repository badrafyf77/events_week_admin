import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:flutter/material.dart';

class EditEventIconButton extends StatelessWidget {
  const EditEventIconButton({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          AppRouter.navigateToWithExtra(context, AppRouter.editEvent, event);
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