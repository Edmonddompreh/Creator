import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../routes/app_routes.dart';
import 'package:creator/features/splash/controllers/splashcontroller.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to changes in the controller state
    ref.listen<bool>(splashControllerProvider, (previous, next) {
      if (next) {
        Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
      }
    });

    // Trigger the delay logic when the screen is built
    ref.read(splashControllerProvider.notifier).navigateAfterDelay();

    return Scaffold(
      body: Container(
        color: Colors.white, // Background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Splash logo image
              Image.asset(
                'assets/images/logo.jpg',
                width: 200, // Adjust width as needed
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              // Optional progress indicator
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
