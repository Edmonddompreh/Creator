import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:creator/features/auth/controllers/signup_controller.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpController = ref.read(signUpControllerProvider.notifier);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon:
                    const Icon(Icons.arrow_back, size: 28, color: Colors.black),
                onPressed: () => signUpController.goToLoginScreen(context),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Input Fields
              TextField(
                onChanged: signUpController.updateFullName,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: signUpController.updateEmail,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                onChanged: signUpController.updatePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                onChanged: signUpController.updateConfirmPassword,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Create Account Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () =>
                    signUpController.goToVerificationScreen(context),
                child: const Center(
                  child: Text(
                    'Create your account',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Terms and Conditions Text
              const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'By signing up you agree to our ',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Terms and Conditions of use',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Or Sign Up With Text
              const Center(
                child: Text(
                  'Or sign up with',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),

              // Social Media Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/facebook_icon.png'),
                    iconSize: 40,
                    onPressed: signUpController.signUpWithFacebook,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Image.asset('assets/google_icon.png'),
                    iconSize: 40,
                    onPressed: signUpController.signUpWithGoogle,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Image.asset('assets/twitter_icon.png'),
                    iconSize: 40,
                    onPressed: signUpController.signUpWithTwitter,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Already Have an Account Button
              TextButton(
                onPressed: () => signUpController.goToLoginScreen(context),
                child: const Center(
                  child: Text(
                    'I have an account',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
