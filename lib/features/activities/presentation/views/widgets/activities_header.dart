import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:events_week_admin/core/utils/customs/refresh_icon.dart';
import 'package:flutter/material.dart';

class ActivitiesHeader extends StatelessWidget {
  const ActivitiesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              onPressed: () {},
              title: "Ajouter une activité",
              backgroundColor: AppColors.kPrimaryColor,
              height: 38,
              width: 220,
            ),
            RefreshIcon(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}