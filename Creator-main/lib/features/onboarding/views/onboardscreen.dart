import 'package:flutter/material.dart';
import 'package:creator/features/onboarding/views/widgets/introscreen1.dart';
import 'package:creator/features/onboarding/views/widgets/introscreen2.dart';
import 'package:creator/features/onboarding/views/widgets/introscreen3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < 2) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finishOnboarding() {
    // Navigate to the next screen (Login)
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          IntroScreen1(onNext: _nextPage),
          IntroScreen2(onNext: _nextPage),
          IntroScreen3(onFinish: _finishOnboarding),
        ],
      ),
    );
  }
}
