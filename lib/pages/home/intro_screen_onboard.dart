import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lofi_application/pages/jazz/jazz_page.dart';

class IntroScreenOnborad extends StatefulWidget {
  @override
  _IntroScreenOnboradState createState() => _IntroScreenOnboradState();
}

class _IntroScreenOnboradState extends State<IntroScreenOnborad> {
  Future<bool> getSkipIntroFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('skipIntro') ?? false;
  }

  Future<void> setSkipIntroFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('skipIntro', true);
  }

  final List<Introduction> list = [
    Introduction(
      imageHeight: 200,
      title: 'Buy & Sell',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/Jazz_Background.jpg',
    ),
    Introduction(
      imageHeight: 200,
      title: 'Delivery',
      subTitle: 'Your order will be immediately collected and',
      imageUrl: 'assets/images/Jazz_Background.jpg',
    ),
    Introduction(
      imageHeight: 200,
      title: 'Receive Money',
      subTitle: 'Pick up delivery at your door and enjoy groceries',
      imageUrl: 'assets/images/Jazz_Background.jpg',
    ),
    Introduction(
      imageHeight: 200,
      title: 'Finish',
      subTitle: 'Browse the menu and order directly from the application',
      imageUrl: 'assets/images/Jazz_Background.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    getSkipIntroFlag().then((skipIntro) {
      if (skipIntro) {
        // Skip intro and navigate to the main page
        navigateToMainPage();
      }
    });
  }

  void navigateToMainPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Jazz_Page(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        setSkipIntroFlag().then((_) {
          navigateToMainPage();
        });
      },
    );
  }
}
