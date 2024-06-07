import 'package:events_week_admin/core/utils/customs/dashboard_screen.dart';
import 'package:events_week_admin/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const home = '/home';
  static const events = '/events';
  static const messages = '/messages';

  static final router = GoRouter(
    initialLocation: home,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return DashboardScreen(body: child);
        },
        routes: [
          GoRoute(
            path: home,
            builder: (context, state) => const HomeView(),
          ),
          GoRoute(
            path: events,
            builder: (context, state) => Container(
              color: Colors.red,
            ),
          ),
          GoRoute(
            path: messages,
            builder: (context, state) => Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    ],
  );

  static void navigateTo(BuildContext context, String path) {
    context.go(
      path,
    );
  }

  static void navigateOff(BuildContext context, String path) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.pushReplacement(path);
  }

  static void pop(BuildContext context) {
    context.pop();
  }
}
