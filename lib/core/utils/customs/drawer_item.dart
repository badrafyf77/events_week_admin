// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.isSelected,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final bool isSelected;
  final String text;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
            color: isSelected ?AppColors.kPrimaryColor : Colors.grey,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: Styles.normal16.copyWith(
              color: isSelected ?AppColors.kPrimaryColor : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
