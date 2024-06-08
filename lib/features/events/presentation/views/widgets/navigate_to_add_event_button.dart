import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:flutter/material.dart';

class NavigateToAddEventButton extends StatefulWidget {
  const NavigateToAddEventButton({super.key});

  @override
  State<NavigateToAddEventButton> createState() =>
      _NavigateToAddEventButtonState();
}

class _NavigateToAddEventButtonState extends State<NavigateToAddEventButton> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovering = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Transform.translate(
          offset: Offset(0, isHovering ? -4 : 0),
        ).transform,
        child: CustomButton(
          onPressed: () {
            AppRouter.navigateTo(context, AppRouter.addEvent);
          },
          title: 'Ajouter un événement',
          backgroundColor: AppColors.kPrimaryColor,
          height: 38,
          width: 220,
        ),
      ),
    );
  }
}
