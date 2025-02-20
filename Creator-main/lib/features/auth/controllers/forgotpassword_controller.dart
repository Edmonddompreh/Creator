import 'package:flutter_riverpod/flutter_riverpod.dart';

// The controller provider to manage the Forgot Password screen state
final forgotPasswordControllerProvider = StateNotifierProvider<ForgotPasswordController, AsyncValue<void>>(
  (ref) => ForgotPasswordController(),
);

class ForgotPasswordController extends StateNotifier<AsyncValue<void>> {
  ForgotPasswordController() : super(const AsyncData(null));

  /// Method to handle email submission
  Future<void> submitEmail(String email) async {
    state = const AsyncLoading(); // Show a loading state
    try {
      // Simulate an API call to submit the email
      await Future.delayed(const Duration(seconds: 2));

      // Reset the state to indicate success
      state = const AsyncData(null);
    } catch (e) {
      // Update the state with an error in case of failure
      state = AsyncError(e, StackTrace.current);
    }
  }
}
