import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashController extends StateNotifier<bool> {
  SplashController() : super(false);

  Future<void> navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    state = true; // Update the state to true to indicate that the timer is complete
  }
}

// Provider for the SplashController
final splashControllerProvider = StateNotifierProvider<SplashController, bool>(
  (ref) => SplashController(),
);
