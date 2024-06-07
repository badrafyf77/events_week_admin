import 'package:events_week_admin/features/home/presentation/view/widgets/analytic.dart';
import 'package:events_week_admin/features/home/presentation/view/widgets/home_body_item.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardItem(),
              DashboardItem(),
              DashboardItem(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SiteAnalytic(),
        ],
      ),
    );
  }
}
