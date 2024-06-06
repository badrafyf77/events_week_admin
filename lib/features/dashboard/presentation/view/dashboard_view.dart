import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          DashDrawer(),
        ],
      ),
    );
  }
}

class DashDrawer extends StatelessWidget {
  const DashDrawer({
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
              height: 120,
              width: 120,
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

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

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
            color: AppColors.kPrimaryColor,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: Styles.normal16.copyWith(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
