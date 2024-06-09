import 'dart:io';
import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/core/config/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:firebase_core/firebase_core.dart';
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EW Admin Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appTheme,
      routerConfig: AppRouter.router,
    );
  }
}
