import 'package:events_week_admin/core/utils/colors.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

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
          offset: Offset(0, isHovering ? -15 : 0),
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