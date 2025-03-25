import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'oboarding_Screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long-running task such as fetching data or initializing resources
    // Use Future.delayed for demonstration, replace it with your actual tasks.
    Future.delayed(const Duration(seconds: 4), () {
      // Navigate to the main screen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: UiColor.backgroundColor,

        // You can customize the splash screen with any widgets you want
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 280,
                height: 212,
                image: AssetImage(
                  "assets/SplashScreen.png",
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
