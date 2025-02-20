import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerificationState {
  final List<String> code;

  VerificationState({this.code = const ['', '', '', '']});

  VerificationState copyWith({List<String>? code}) {
    return VerificationState(
      code: code ?? this.code,
    );
  }
}

class VerificationController extends StateNotifier<VerificationState> {
  VerificationController() : super(VerificationState());

  void updateCode(int index, String value) {
    final updatedCode = List<String>.from(state.code);
    updatedCode[index] = value;
    state = state.copyWith(code: updatedCode);
  }

  void verifyCode(BuildContext context) {
    final enteredCode = state.code.join();
    if (enteredCode.length != 4 || enteredCode.contains('')) {
      _showErrorDialog(context, 'Please enter a valid 4-digit code.');
      return;
    }

    // Add logic to verify the code (e.g., API call)
    if (enteredCode == "1234") {
      
      Navigator.pushNamed(context, '/home'); // Navigate to home screen
    } else {
      _showErrorDialog(context, 'Invalid verification code. Please try again.');
    }
  }

  void resendCode() {
    // Add logic to resend the code (like, API call)
    
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

final verificationControllerProvider =
    StateNotifierProvider<VerificationController, VerificationState>(
  (ref) => VerificationController(),
);
