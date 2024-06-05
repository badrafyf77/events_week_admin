import 'package:events_week_admin/core/config/theme.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EW Admin Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appTheme,
      home: const DashboardView(),
    );
  }
}
