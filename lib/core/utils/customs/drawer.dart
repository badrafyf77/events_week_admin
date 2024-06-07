// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    super.key,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int currentIndex = 1;
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
                drawerItem(
                  context,
                  1,
                  'Dashboard',
                  Icons.dashboard,
                ),
                const SizedBox(
                  height: 40,
                ),
                drawerItem(
                  context,
                  2,
                  'Events',
                  Icons.event,
                ),
                const SizedBox(
                  height: 40,
                ),
                drawerItem(
                  context,
                  3,
                  'Message',
                  Icons.message,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _itemClick(BuildContext context, int index) {
    switch (index) {
      case 1:
        GoRouter.of(context).go(AppRouter.home);
        break;
      case 2:
        GoRouter.of(context).go(AppRouter.events);
        break;
      case 3:
        GoRouter.of(context).go(AppRouter.messages);
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  Widget drawerItem(
      BuildContext context, int index, String title, IconData icon) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        _itemClick(context, index);
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
            color:
                currentIndex == index ? AppColors.kPrimaryColor : Colors.grey,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: Styles.normal16.copyWith(
              color:
                  currentIndex == index ? AppColors.kPrimaryColor : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
