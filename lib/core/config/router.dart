import 'package:events_week_admin/core/utils/customs/dashboard_screen.dart';
import 'package:events_week_admin/core/utils/customs/drawer.dart';
import 'package:events_week_admin/features/events/presentation/views/add_event_view.dart';
import 'package:events_week_admin/features/events/presentation/views/events_view.dart';
import 'package:events_week_admin/features/home/presentation/view/home_view.dart';
import 'package:events_week_admin/features/messages/presentation/views/messages_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
      opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
      child: child,
    ),
  );
}

class AppRouter {
  static const home = '/home';
  static const events = '/events';
  static const addEvent = '/addEvent';
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
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const HomeView(),
            ),
          ),
          GoRoute(
            path: events,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const EventsView(),
            ),
          ),
          GoRoute(
            path: messages,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const MessagesView(),
            ),
          ),
          GoRoute(
            path: addEvent,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const AddEventView(),
            ),
          ),
        ],
      ),
    ],
  );

  static void navigateTo(BuildContext context, String path, int index) {
    GoRouter.of(context).go(path);
    AppDrawerState.currentIndex = index;
  }

  static void navigateOff(BuildContext context, String path) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.pushReplacement(path);
  }

  static void pop(BuildContext context) {
    context.pop();
  }
}
