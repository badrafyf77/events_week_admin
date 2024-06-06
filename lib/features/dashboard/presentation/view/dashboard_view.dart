import 'package:events_week_admin/core/utils/customs/drawer.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/widgets/dash_body.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/widgets/dash_header.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          AppDrawer(),
          Expanded(
            child: Column(
              children: [
                DashboardHeader(),
                DashboardBody(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

