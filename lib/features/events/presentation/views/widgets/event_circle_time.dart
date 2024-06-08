import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class EventCercleTime extends StatelessWidget {
  const EventCercleTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: AppColors.kPrimaryColor,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '11',
              style: Styles.normal15.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              'Mars',
              style: Styles.normal12.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
