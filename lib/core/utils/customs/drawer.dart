import 'package:events_week_admin/core/utils/customs/drawer_item.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 140,
            child: Image.asset(
              AppImages.logo,
              height: 90,
              width: 90,
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
                  text: 'Dashboard',
                  icon: Icons.dashboard,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  text: 'Events',
                  icon: Icons.event,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
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