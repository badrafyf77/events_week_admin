import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NavigateBackIcon extends StatelessWidget {
  const NavigateBackIcon({
    super.key, required this.onPressed, required this.title,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_back,
            size: 35,
          ),
        ),
        Text(
          title,
          style: Styles.normal20,
        ),
      ],
    );
  }
}
