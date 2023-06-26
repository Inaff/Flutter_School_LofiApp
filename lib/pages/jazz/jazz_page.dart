import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lofi_application/plugin/sound_effect.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Jazz_Page extends StatefulWidget {
  const Jazz_Page({Key? key}) : super(key: key);

  @override
  State<Jazz_Page> createState() => _HomePageState();
}

class _HomePageState extends State<Jazz_Page> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  double volume = 0.4;
  bool isMuted = false;
  double previousVolume = 1.0;

  final List<String> songs = [
    "https://kathy.torontocast.com:3350/;",
    "https://streaming.wkar.msu.edu/wkar-jazz"
  ];
  int currentSongIndex = 0;

  final List<String> chennel = ["Japaness", "Tokyo"];
  int currentChennelIndex = 0;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    //Set use initState add wiget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // showLoadDialogBox(context);
      playRadioStream(songs[currentSongIndex]);
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void changeVolume(double value) {
    audioPlayer.setVolume(value);
    setState(() {
      volume = value;
      if (isMuted) {
        isMuted = false;
      }
    });
  }

  void toggleMute() {
    setState(() {
      if (isMuted) {
        changeVolume(previousVolume);
        isMuted = false;
      } else {
        previousVolume = volume;
        changeVolume(0.0);
        isMuted = true;
      }
    });
  }

  void playRadioStream(String url) async {
    await checkConnectivity();
  }

  void stopRadioStream() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  void playNextSong() async {
    if (currentSongIndex < songs.length - 1) {
      currentSongIndex++;
      currentChennelIndex++;
      stopRadioStream();
      playRadioStream(songs[currentSongIndex]);
    }
  }

  void playPreviousSong() {
    if (currentSongIndex > 0) {
      currentSongIndex--;
      currentChennelIndex--;
      stopRadioStream();
      playRadioStream(songs[currentSongIndex]);
    }
  }

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
                    backgroundColor: Colors.pinkAccent,
                    color: Colors.cyanAccent),
                const SizedBox(
                  height: 30,
                ),
                // Some text
                // Text(
                //   'LOADING',
                //   style: TextStyle(
                //       color: Colors.pinkAccent,
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold),
                // )
                // Container(
                //   alignment: Alignment.center,
                //   height: 20,
                //   width: 100,
                //   child: AnimatedTextKit(
                //     animatedTexts: [
                //       FadeAnimatedText(
                //         'LOADING',
                //         textStyle: const TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.pinkAccent,
                //         ),
                //         // speed: const Duration(milliseconds: 2000),
                //       ),
                //     ],
                //     // totalRepeatCount: 4,
                //     // pause: const Duration(milliseconds: 1000),
                //     // displayFullTextOnTap: true,
                //     // stopPauseOnTap: true,
                //   ),
                // )
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

  checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'No Internet Connection',
              style: TextStyle(color: Colors.pinkAccent),
            ),
            content: const Text(
                'Please check your internet connection and try again.'),
            actions: [
              TextButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.pinkAccent)),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // ignore: use_build_context_synchronously
      showLoadDialogBox(context);
      await audioPlayer.setUrl(songs[currentSongIndex]);
      audioPlayer.play();
      Future.delayed(const Duration(seconds: 1));
      setState(() {
        isPlaying = true;
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.pinkAccent,
      Colors.pink,
      Colors.tealAccent,
      Colors.blueAccent,
    ];

    const colorizeTextStyle =
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 250.0,
          child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                speed: Duration(seconds: 1),
                'LOFI APP',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ],
            repeatForever: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 10),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage('assets/image/background_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Text(chennel[currentChennelIndex].toString()),
          Center(
            child: SizedBox(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      speed: const Duration(milliseconds: 200),
                      chennel[currentChennelIndex].toString(),
                    ),
                    TypewriterAnimatedText(
                      speed: const Duration(milliseconds: 200),
                      "Streaming now:",
                    ),
                  ],
                  repeatForever: true,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: isMuted
                          ? const Icon(
                              Icons.volume_off,
                              color: Colors.pinkAccent,
                            )
                          : const Icon(
                              Icons.volume_up,
                              color: Colors.grey,
                            ),
                      onPressed: toggleMute,
                    ),
                    Expanded(
                      child: Slider(
                        value: volume,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (value) {
                          changeVolume(value);
                        },
                        activeColor: Colors.pinkAccent,
                        inactiveColor: Colors.blueGrey,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.grey,
                      ),
                      onPressed: playPreviousSong,
                    ),
                    IconButton(
                      icon: isPlaying
                          ? const Icon(
                              Icons.pause,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.play_arrow,
                              color: Colors.pinkAccent,
                            ),
                      onPressed: () {
                        if (isPlaying) {
                          stopRadioStream();
                        } else {
                          playRadioStream(songs[currentSongIndex]);
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.grey,
                      ),
                      onPressed: playNextSong,
                    ),
                  ],
                ),
                const SoundEffect(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//saves