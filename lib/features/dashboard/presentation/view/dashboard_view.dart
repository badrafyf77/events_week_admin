import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const DashDrawer(),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 50,
                  color: Colors.white,
                ),
                const Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashboardItem(),
                        DashboardItem(),
                        DashboardItem(),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  const DashboardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: const BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Icon(
                  Icons.event,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Events',
                    style: Styles.normal16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '384',
                    style: Styles.normal12.copyWith(
                      color: AppColors.kSecondColor,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
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
