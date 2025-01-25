import 'package:flutter/material.dart';
import 'package:creator/features/splash/views/splashscreen.dart';
import 'package:creator/features/onboarding/views/onboardscreen.dart';
//import '../features/auth/views/login_screen.dart';
//import '../features/home/views/home_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signupScreen';
  static const String forgotpassword = '/forgot_password';
  static const String verification = '/verification';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    onboarding: (context) => OnboardingScreen(),
    login: (context) => LoginScreen(),
    signup: (context) => signupScreen(),
    forgotpassword: (context) => forgotpassword(),
    verification: (context) => verification(),
    home: (context) => HomeScreen(),
  };
}
