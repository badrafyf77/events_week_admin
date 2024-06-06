// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:events_week_admin/core/utils/customs/drawer_item.dart';
import 'package:events_week_admin/core/utils/images.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.isDashSelected,
    required this.isEventsSelected,
    required this.isMessagesSelected,
  });

  final bool isDashSelected;
  final bool isEventsSelected;
  final bool isMessagesSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(
              AppImages.logo,
              height: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  isSelected: isDashSelected,
                  text: 'Dashboard',
                  icon: Icons.dashboard,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  isSelected: isEventsSelected,
                  text: 'Events',
                  icon: Icons.event,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  isSelected: isMessagesSelected,
                  text: 'Messages',
                  icon: Icons.message,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
