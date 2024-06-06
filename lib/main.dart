import 'package:events_week_admin/core/config/theme.dart';
import 'package:events_week_admin/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    const initialSize = Size(1200, 650);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = 'Events Week Admin';
    appWindow.show();
  });
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
