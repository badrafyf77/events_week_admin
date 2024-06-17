import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/animated_container.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:flutter/material.dart';

class NavigateToAddEventButton extends StatelessWidget {
  const NavigateToAddEventButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      child: CustomButton(
        onPressed: () {
          AppRouter.navigateTo(context, AppRouter.addEvent);
        },
        title: 'Ajouter un événement',
        backgroundColor: AppColors.kPrimaryColor,
        height: 38,
        width: 220,
      ),
    );
  }
}
