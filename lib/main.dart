import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const DineHubApp());
}

class DineHubApp extends StatelessWidget {
  const DineHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DineHub',
      theme: AppTheme.lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
