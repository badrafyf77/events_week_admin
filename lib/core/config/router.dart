import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/models/message_model.dart';
import 'package:events_week_admin/core/utils/customs/dashboard_screen.dart';
import 'package:events_week_admin/features/activities/presentation/views/activities_view.dart';
import 'package:events_week_admin/features/activities/presentation/views/add_activity_view.dart';
import 'package:events_week_admin/features/activities/presentation/views/edit_activity_view.dart';
import 'package:events_week_admin/features/auth/presentation/views/sign_in_view.dart';
import 'package:events_week_admin/features/events/presentation/views/add_event_view.dart';
import 'package:events_week_admin/features/events/presentation/views/edit_event_view.dart';
import 'package:events_week_admin/features/events/presentation/views/event_info_view.dart';
import 'package:events_week_admin/features/events/presentation/views/events_view.dart';
import 'package:events_week_admin/features/gallery/presentation/views/add_gallery_view.dart';
import 'package:events_week_admin/features/gallery/presentation/views/gallery_view.dart';
import 'package:events_week_admin/features/home/presentation/view/home_view.dart';
import 'package:events_week_admin/features/messages/presentation/views/message_info_view.dart';
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
  static const eventInfo = '/eventInfo';
  static const editEvent = '/editEvent';
  static const activities = '/activities';
  static const addActivity = '/addActivity';
  static const editActivity = '/editActivity';
  static const gallery = '/gallery';
  static const addGallery = '/addGallery';
  static const messages = '/messages';
  static const messageInfo = '/messageInfo';

  static final router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SignInView(),
        ),
      ),
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
            path: addEvent,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const AddEventView(),
            ),
          ),
          GoRoute(
              path: eventInfo,
              pageBuilder: (context, state) {
                Event event = state.extra as Event;
                return buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: EventInfoView(
                    event: event,
                  ),
                );
              }),
          GoRoute(
              path: editEvent,
              pageBuilder: (context, state) {
                Event event = state.extra as Event;
                return buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: EditEventView(
                    event: event,
                  ),
                );
              }),
          GoRoute(
            path: activities,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const ActivitiesView(),
            ),
          ),
          GoRoute(
            path: addActivity,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const AddActivityView(),
            ),
          ),
          GoRoute(
            path: editActivity,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const EditActivityView(),
            ),
          ),
          GoRoute(
            path: gallery,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const GalleryView(),
            ),
          ),
          GoRoute(
            path: addGallery,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: const AddGalleryView(),
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
            path: messageInfo,
            pageBuilder: (context, state) {
              Message message = state.extra as Message;
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: MessageInfoView(
                  message: message,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );

  static void navigateTo(BuildContext context, String path) {
    GoRouter.of(context).go(path);
  }

  static void navigateToWithExtra(
      BuildContext context, String path, Object extra) {
    GoRouter.of(context).go(path, extra: extra);
  }

  static void navigateOff(BuildContext context, String path) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.pushReplacement(path);
  }

  static void pop(BuildContext context) {
    context.pop();
  }
}
