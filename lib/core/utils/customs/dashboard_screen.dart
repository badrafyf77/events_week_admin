import 'package:events_week_admin/core/utils/customs/appbar.dart';
import 'package:events_week_admin/core/utils/customs/drawer.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Row(
        children: [
          const AppDrawer(),
          Expanded(
            child: body,
          )
        ],
      ),
    );
  }
}
