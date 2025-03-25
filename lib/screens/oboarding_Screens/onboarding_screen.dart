import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../login_Screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Discover Endless Recipes",
      "description":
          "Swipe through a world of flavors! From quick snacks to gourmet meals, explore recipes that inspire your next dish.",
      "image": "assets/IntroImages1.png"
    },
    {
      "title": "Share Your Creations",
      "description":
          "Got a favorite recipe? Record, edit, and post it to show off your cooking skills. Inspire others with your delicious creations!.",
      "image": "assets/IntroImages2.png"
    },
    {
      "title": "Connect with Food Lovers",
      "description":
          "Follow chefs and fellow foodies, engage with their recipes, and join a community that’s as passionate about food as you are.",
      "image": "assets/IntroImages3.png"
    }
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      _goToHomeScreen();
    }
  }

  void _goToHomeScreen() {
    // Navigate to home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
    if (kDebugMode) {
      print("Onboarding Completed! Navigate to Home.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColor.backgroundColor,
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      onboardingData[index]["image"]!,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: Text(
                      onboardingData[index]["title"]!,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 2),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      onboardingData[index]["description"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 15),
                    child: Container(
                      height: 56,
                      width: MediaQuery.of(context).size.width,
                      color: UiColor.containerColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:
                                  List.generate(onboardingData.length, (index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  width: _currentPage == index ? 32 : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: _currentPage == index
                                        ? UiColor.dotsColor
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 32),
                            child: TextButton(
                              onPressed: _nextPage,
                              child: Text(
                                _currentPage == onboardingData.length - 1
                                    ? "Get Started"
                                    : "Next",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ]),
      ),
    );
  }
}

