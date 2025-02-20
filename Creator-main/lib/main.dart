import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:creator/core/theme/app_theme.dart';
import 'package:device_preview_plus/device_preview_plus.dart';

void main() {
  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creator',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
