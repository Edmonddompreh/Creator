import 'package:flutter/material.dart';
import '../../../routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to the onboarding screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });

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
