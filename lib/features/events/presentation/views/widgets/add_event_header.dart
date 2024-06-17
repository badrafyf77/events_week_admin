import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';

class AddEventHeader extends StatelessWidget {
  const AddEventHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigateBackIcon(
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.events);
          },
        ),
        Text(
          'Ajouter Un Nouvel Événement',
          style: Styles.normal20,
        ),
      ],
    );
  }
}
