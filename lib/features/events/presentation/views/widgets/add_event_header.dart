import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AddEventHeader extends StatelessWidget {
  const AddEventHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.events);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 40,
          ),
        ),
        Text(
          'Ajouter Un Nouvel Événement',
          style: Styles.normal20,
        ),
      ],
    );
  }
}