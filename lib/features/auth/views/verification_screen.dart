import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:creator/features/auth/controllers/verification_controller.dart';

class VerificationScreen extends ConsumerWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verificationController =
        ref.read(verificationControllerProvider.notifier);
    final code = ref.watch(verificationControllerProvider).code;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              // Logo
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/logo.png', // Replace with the path to your logo
                  height: 80,
                ),
              ),

              // Heading
              const SizedBox(height: 20),
              const Text(
                'Verifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              // Instruction
              const SizedBox(height: 10),
              const Text(
                'Enter the verification to complete sign up',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              // Verification Code Input
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: TextField(
                        maxLength: 1,
                        onChanged: (value) =>
                            verificationController.updateCode(index, value),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          counterText: '', // Hide the counter text
                        ),
                        style: const TextStyle(fontSize: 24, letterSpacing: 8),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  );
                }),
              ),

              // Done Button
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => verificationController.verifyCode(context),
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              // Resend Code
              const SizedBox(height: 10),
              TextButton(
                onPressed: verificationController.resendCode,
                child: const Text(
                  'Resend code',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
