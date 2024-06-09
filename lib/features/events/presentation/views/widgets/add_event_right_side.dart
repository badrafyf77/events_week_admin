import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/customs/button.dart';
import 'package:flutter/material.dart';

class AddEventRightSide extends StatelessWidget {
  const AddEventRightSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 340,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          onPressed: () {},
          title: "Ajouter",
          backgroundColor: AppColors.kPrimaryColor,
          height: 35,
          width: 130,
        ),
      ],
    );
  }
}