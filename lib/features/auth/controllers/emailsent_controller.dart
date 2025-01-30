import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailSentControllerProvider = Provider<EmailSentController>(
  (ref) => EmailSentController(),
);

class EmailSentController {
  void resendEmail() {
    // Logic for resending the email be here
  }
}
