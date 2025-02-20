import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../features/auth/controllers/login_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginControllerProvider);
    final loginController = ref.read(loginControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Image
                Image.asset(
                  'assets/images/logo.jpg',
                  height: 100,
                ),
                const SizedBox(height: 40),

                // Email TextField
                TextField(
                  controller: loginController.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password TextField
                TextField(
                  controller: loginController.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Show loading indicator if loading
                if (loginState.isLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () => loginController.signIn(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                const SizedBox(height: 10),

                // Forgot Password Button
                TextButton(
                  onPressed: () => loginController.forgotPassword(context),
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 20),

                // Error Message
                if (loginState.errorMessage != null)
                  Text(
                    loginState.errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                const SizedBox(height: 20),

                const Text(
                  'Or sign in with',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 20),

                // Social Media Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: loginController.signInWithFacebook,
                      icon: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: loginController.signInWithGoogle,
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: loginController.signInWithTwitter,
                      icon: const FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                ElevatedButton(
                  onPressed: () => loginController.signUp(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
