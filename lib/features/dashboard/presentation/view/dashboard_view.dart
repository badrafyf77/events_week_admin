import 'package:events_week_admin/core/utils/customs/appbar.dart';
import 'package:events_week_admin/core/utils/customs/drawer.dart';
import 'package:flutter/material.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/widgets/dash_body.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/widgets/dash_header.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const Row(
        children: [
          AppDrawer(
            isDashSelected: true,
            isEventsSelected: false,
            isMessagesSelected: false,
          ),
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