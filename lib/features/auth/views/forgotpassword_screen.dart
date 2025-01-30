import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'emailsent_screen.dart';
import 'package:creator/features/auth/controllers/forgotpassword_controller.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching the ForgotPasswordController for state updates
    final controllerState = ref.watch(forgotPasswordControllerProvider);

    // Accessing the controller itself
    final controller = ref.read(forgotPasswordControllerProvider.notifier);

    // Email text field controller
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forgot Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Forgot your password or need help accessing your account? Reset it now with just a few clicks.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controllerState is AsyncLoading
                  ? null
                  : () async {
                      await controller.submitEmail(emailController.text);

                      // Navigate to the email sent screen if successful
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EmailSentScreen(),
                          ),
                        );
                      }
                    },
              child: controllerState is AsyncLoading
                  ? const CircularProgressIndicator(color: Colors.red)
                  : const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
