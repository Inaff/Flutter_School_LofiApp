import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:lofi_application/pages/home/song_select_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      title: 'Immerse Yourself in Relaxing Melodies',
      titleTextStyle: const TextStyle(
        color: Colors.teal,
        fontSize: 17,
      ),
      subTitleTextStyle: const TextStyle(
        fontSize: 15,
      ),
      subTitle:
          'Experience the power of relaxation through our carefully curated collection of soothing music. From gentle piano melodies to calming nature sounds, our app offers a wide range of serene tunes that will help you find tranquility and unwind from the stresses of everyday life',
      imageUrl: 'assets/gifs/onborad1.gif',
    ),
    Introduction(
      imageHeight: 200,
      title: 'Find Your Perfect Peaceful Ambiance',
      titleTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 18,
      ),
      subTitleTextStyle: const TextStyle(
        fontSize: 15,
      ),
      subTitle:
          'Discover a variety of genres specially crafted to create the perfect ambiance for relaxation. Whether you prefer ambient electronic beats, soft acoustic melodies, or the gentle rustle of a forest, our app provides an extensive selection of music that is designed to create a calming atmosphere wherever you are',
      imageUrl: 'assets/gifs/onborad2.gif',
    ),
    Introduction(
      imageHeight: 200,
      title: 'Personalize Your Relaxing Journey',
      titleTextStyle: const TextStyle(
        color: Colors.pinkAccent,
        fontSize: 18,
      ),
      subTitleTextStyle: const TextStyle(
        fontSize: 15,
      ),
      subTitle:
          'Tailor your relaxation experience to your own preferences. Create your own custom playlists and select your favorite tracks to curate a personal sanctuary of tranquility. Let the music wash over you and create a peaceful oasis that helps you escape the noise of the world',
      imageUrl: 'assets/gifs/onborad3.gif',
    ),
    Introduction(
      imageHeight: 200,
      title: 'Enjoy',
      titleTextStyle: GoogleFonts.spaceMono(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
      subTitleTextStyle: GoogleFonts.spaceMono(),
      imageUrl: 'assets/gifs/onborad4.gif',
      subTitle: '',
    ),
  ];

  Widget onborading(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      backgroudColor: Colors.white,
      foregroundColor: Colors.pinkAccent,
      skipTextStyle: const TextStyle(color: Colors.pinkAccent, fontSize: 15),
      onTapSkipButton: () {
        setSkipIntroFlag().then((_) {
          navigateToMainPage();
        });
      },
    );
  }

  void navigateToMainPage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SongSelectPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getSkipIntroFlag(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!) {
            navigateToMainPage();
            return Container(); // Or any other widget if needed
          } else {
            return onborading(context);
          }
        }
        return Container(); // Placeholder widget while waiting for data
      },
    );
  }
}
