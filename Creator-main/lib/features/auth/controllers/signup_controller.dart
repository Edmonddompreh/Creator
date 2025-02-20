import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:creator/features/auth/views/verification_screen.dart';
import 'package:creator/features/auth/views/login_screen.dart';

class SignUpState {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpState({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  SignUpState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}

class SignUpController extends StateNotifier<SignUpState> {
  late final BuildContext context;

  SignUpController(this.context) : super(const SignUpState());

  void updateFullName(String value) {
    state = state.copyWith(fullName: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void updateConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value);
  }

  void goToVerificationScreen(BuildContext context) {
    if (_validateInputs()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VerificationScreen()),
      );
    }
  }

  void goToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  bool _validateInputs() {
    if (state.fullName.isEmpty) {
      _showErrorDialog('Please enter your full name.');
      return false;
    }

    if (state.email.isEmpty || !_isValidEmail(state.email)) {
      _showErrorDialog('Please enter a valid email address.');
      return false;
    }

    if (state.password.isEmpty || state.password.length < 10) {
      _showErrorDialog('Password must be at least 10 characters long.');
      return false;
    }

    if (state.confirmPassword.isEmpty || state.confirmPassword != state.password) {
      _showErrorDialog('Passwords do not match.');
      return false;
    }

    return true;
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Implementing Sign Up with Google
  void signUpWithGoogle() {
    // Placeholder implementation - Add Google Sign-In logic here
    
    
  }

  // Implementing Sign Up with Facebook
  void signUpWithFacebook() {
    // Placeholder implementation - Add Facebook Sign-In logic here
   
   
  }

  // Implementing Sign Up with Twitter
  void signUpWithTwitter() {
    // Placeholder implementation - Add Twitter Sign-In logic here
    
    
  }
}

final signUpControllerProvider =
    StateNotifierProvider<SignUpController, SignUpState>(
  (ref) => throw UnimplementedError(), // Provide context at instantiation
);
