import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:creator/features/auth/controllers/emailsent_controller.dart';

class EmailSentScreen extends ConsumerWidget {
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(emailSentControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Sent'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Password Reset Email Sent',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Check your email for a password reset link and follow the instructions to regain access. The reset link has been sent!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text('Done'),
            ),
            TextButton(
              onPressed: () => controller.resendEmail(),
              child: const Text(
                'Resend email',
                style: TextStyle(color: Colors.red),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
