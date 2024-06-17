import 'package:flutter/material.dart';

class NavigateBackIcon extends StatelessWidget {
  const NavigateBackIcon({
    super.key, required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back,
          size: 35,
        ),
      ),
    );
  }
}
