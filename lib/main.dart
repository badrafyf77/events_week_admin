import 'dart:io';
import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/config/theme.dart';
import 'package:events_week_admin/core/utils/service_locator.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo_implementation.dart';
import 'package:events_week_admin/features/events/presentation/manager/add%20event%20bloc/add_event_bloc.dart';
import 'package:events_week_admin/features/events/presentation/manager/get%20events%20cubit/get_events_cubit.dart';
import 'package:events_week_admin/features/events/presentation/manager/set%20initial%20event%20bloc/set_initial_event_bloc.dart';
import 'package:events_week_admin/features/home/data/home_repo_implementation.dart';
import 'package:events_week_admin/features/home/presentation/manager/count%20events%20cubit/count_events_cubit.dart';
import 'package:events_week_admin/features/messages/data/repo/messages_repo_implementation.dart';
import 'package:events_week_admin/features/messages/presentation/manager/get%20messages%20cubit/get_messages_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  if (!kIsWeb && Platform.isWindows) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      debugPrint('Erreur : $e');
    }
  }
  runApp(const MyApp());
  doWhenWindowReady(() {
    const initialSize = Size(1200, 650);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = 'Events Week Admin';
    appWindow.show();
  });
  setupServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AddEventBloc(
            getIt.get<EventsRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => GetEventsCubit(
            getIt.get<EventsRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => GetMessagesCubit(
            getIt.get<MessagesRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => SetInitialEventBloc(
            getIt.get<EventsRepoImplementation>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => CountEventsCubit(
            getIt.get<HomeRepoImplementation>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'EW Admin Dashboard',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.appTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
