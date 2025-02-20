import 'package:flutter/material.dart';
import 'package:creator/features/splash/views/splashscreen.dart';
import 'package:creator/features/onboarding/views/onboardscreen.dart';
import '../features/auth/views/login_screen.dart';
import 'package:creator/features/auth/views/signup_screen.dart';
import 'package:creator/features/auth/views/verification_screen.dart';
import 'package:creator/features/auth/views/forgotpassword_screen.dart';
import 'package:creator/features/home/view/homescreen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signupScreen';
  static const String forgotpassword = '/forgot_password';
  static const String verification = '/verification';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    onboarding: (context) => const OnboardingScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignUpScreen(),
    forgotpassword: (context) => const ForgotPasswordScreen(),
    verification: (context) => const VerificationScreen(),
    home: (context) => const HomeScreen(),
  };
}
