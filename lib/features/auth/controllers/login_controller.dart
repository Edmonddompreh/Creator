import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// LoginState to manage state transitions
class LoginState {
  final bool isLoading;
  final String? errorMessage;

  const LoginState({this.isLoading = false, this.errorMessage});
}

// StateNotifier to manage the login logic
class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(const LoginState());

  // Mock user data
  static final Map<String, String> mockUsers = {
    'edmonddompreh@gmail.com': 'password123',
  };

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Sign-in logic
  Future<void> signIn(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      state = LoginState(errorMessage: 'Please fill in all fields.');
      return;
    }

    // Show loading state
    state = const LoginState(isLoading: true);

    // Simulate a delay for authentication
    await Future.delayed(const Duration(seconds: 1));

    if (mockUsers[email] == password) {
      // Navigate to home screen if login succeeds
      Navigator.pushNamed(context, '/home');
      state = const LoginState(); // Reset state
    } else {
      state = LoginState(errorMessage: 'Invalid email or password.');
    }
  }

  // Forgot password logic
  void forgotPassword(BuildContext context) {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      state = LoginState(errorMessage: 'Please enter your email address.');
      return;
    }

    if (mockUsers.containsKey(email)) {
      state = const LoginState();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset link has been sent to $email.')),
      );
    } else {
      state = LoginState(errorMessage: 'No account found with this email.');
    }
  }

  // Sign-up logic
  void signUp(BuildContext context) {
    Navigator.pushNamed(context, '/signup');
  }

  // Social sign-in placeholders
  void signInWithFacebook() {
    debugPrint('Signing in with Facebook...');
  }

  void signInWithGoogle() {
    debugPrint('Signing in with Google...');
  }

  void signInWithTwitter() {
    debugPrint('Signing in with Twitter...');
  }
}

// Provider for LoginController
final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController();
});
