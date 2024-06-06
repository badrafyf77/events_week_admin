import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/images.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/widgets/bar_chart.dart';
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
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashboardItem(),
                        DashboardItem(),
                        DashboardItem(),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: 500,
                      color: Colors.white,
                      child: const BarChartSample3(),
                    ),
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

class DashboardItem extends StatefulWidget {
  const DashboardItem({super.key});

  @override
  State<DashboardItem> createState() => _DashboardItemState();
}

class _DashboardItemState extends State<DashboardItem> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovering = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          color: isHovering ? AppColors.kPrimaryColor : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.all(10.0),
        duration: const Duration(milliseconds: 250),
        transform: Transform.translate(
          offset: Offset(0, isHovering ? -20 : 0),
        ).transform,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: isHovering ? Colors.white : AppColors.kSecondColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Events',
                        style: Styles.normal16.copyWith(
                          color: isHovering ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        '384',
                        style: Styles.normal12.copyWith(
                          color:
                              isHovering ? AppColors.kSecondColor : Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chevron_right,
                  color: isHovering ? Colors.white : AppColors.kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
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

class UpDown extends StatefulWidget {
  const UpDown({super.key});

  @override
  UpDownState createState() {
    return UpDownState();
  }
}

class UpDownState extends State<UpDown> {
  bool up = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          padding: const EdgeInsets.all(10.0),
          duration: const Duration(milliseconds: 250), // Animation speed
          transform: Transform.translate(
            offset: Offset(0, up ? -100 : 0), // Change -100 for the y offset
          ).transform,
          child: SizedBox(
            height: 50.0,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: const Icon(Icons.ac_unit),
              onPressed: () {
                setState(() {
                  up = !up;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
