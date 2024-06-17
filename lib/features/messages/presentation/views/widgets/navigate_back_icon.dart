import 'package:events_week_admin/core/config/router.dart';
import 'package:flutter/material.dart';

class NavigateBackIcon extends StatelessWidget {
  const NavigateBackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {
          AppRouter.navigateTo(context, AppRouter.messages, 3);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 35,
        ),
      ),
    );
  }
}
