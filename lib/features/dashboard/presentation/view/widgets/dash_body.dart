import 'package:events_week_admin/features/dashboard/presentation/view/widgets/bar_chart.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/widgets/dash_body_item.dart';
import 'package:flutter/material.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

