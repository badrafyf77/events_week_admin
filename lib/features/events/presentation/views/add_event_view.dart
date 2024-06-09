import 'package:events_week_admin/core/config/router.dart';
import 'package:flutter/material.dart';

class AddEventView extends StatelessWidget {
  const AddEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddEventHeader();
  }
}

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
        )
      ],
    );
  }
}
