import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void showLoadDialogBox(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        // The background color
        backgroundColor: Colors.white,
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(100),
                topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // The loading indicator
              const CircularProgressIndicator(
                  backgroundColor: Colors.pinkAccent, color: Colors.cyanAccent),
              const SizedBox(
                height: 30,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'LOADING',
                    ),
                    WavyAnimatedText('RELAX'),
                    WavyAnimatedText('WANNA DRINK COFFEE'),
                  ],
                  // onTap: () {
                  //   print("Tap Event");
                  // },
                  repeatForever: true,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
