import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lofi_application/others/loading.dart';
import 'package:lofi_application/others/lost_connection.dart';
import 'package:lofi_application/others/sound_effect.dart';
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
  bool limitPrevious = false;
  bool limitNext = false;
  double previousVolume = 1.0;

  final List<String> songs = [
    "https://stream.relaxfm.ee/cafe_HD",
    "https://centova5.transmissaodigital.com:20104/stream?type=http&nocache=54201",
    "https://radio.netyco.com:18056/stream?type=http&nocache=20681"
  ];
  int currentSongIndex = 0;

  final List<String> chennel = ["JAZZ VER.1", "JAZZ VER.2", "JAZZ VER.3"];
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

    if (currentSongIndex > 0) {
    } else {
      limitPrevious = true;
    }
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
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        checkConnectivity(context);
      });
    } else {
      setState(() {
        showLoadDialogBox(context);
      });

      await audioPlayer.setUrl(songs[currentSongIndex]);
      audioPlayer.play();
      Future.delayed(const Duration(seconds: 1));
      setState(() {
        isPlaying = true;
        Navigator.of(context).pop();
      });
    }
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
      limitPrevious = false;
      print("currentSongIndex is: $currentSongIndex");
      print("songs $songs");
      if (currentSongIndex == songs.length - 1) {
        limitNext = true;
      }
    }
  }

  void playPreviousSong() {
    if (currentSongIndex > 0) {
      currentSongIndex--;
      currentChennelIndex--;
      stopRadioStream();
      playRadioStream(songs[currentSongIndex]);
      limitNext = false;
      if (currentSongIndex == 0) {
        limitPrevious = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.pinkAccent),
        title: SizedBox(
          width: 250.0,
          child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                speed: const Duration(seconds: 1),
                'LOFI APP',
                textStyle: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
                colors: [
                  Colors.pinkAccent,
                  Colors.pink,
                  Colors.tealAccent,
                  Colors.blueAccent,
                ],
              ),
            ],
            repeatForever: true,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 30,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Jazz_Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 10),
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.pinkAccent, width: 2),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(100),
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/Jazz_Background.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Text(chennel[currentChennelIndex].toString()),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: SizedBox(
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 20.0,
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
                    ),
                    const SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top:
                                      BorderSide(width: 2, color: Colors.white),
                                  bottom:
                                      BorderSide(width: 2, color: Colors.white),
                                ),
                                color: Colors.pinkAccent,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: isMuted
                                        ? const Icon(
                                            Icons.volume_off,
                                            color: Colors.tealAccent,
                                          )
                                        : const Icon(
                                            Icons.volume_up,
                                            color: Colors.white,
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
                                      activeColor: Colors.white,
                                      inactiveColor: Colors.white30,
                                    ),
                                  ),
                                  IconButton(
                                    icon: limitPrevious
                                        ? const Icon(
                                            Icons.skip_previous,
                                            color: Colors.white38,
                                          )
                                        : const Icon(
                                            Icons.skip_previous,
                                            color: Colors.white,
                                          ),
                                    onPressed: playPreviousSong,
                                  ),
                                  IconButton(
                                    icon: isPlaying
                                        ? const Icon(
                                            Icons.pause,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.play_arrow,
                                            color: Colors.tealAccent,
                                          ),
                                    onPressed: () {
                                      if (isPlaying) {
                                        stopRadioStream();
                                      } else {
                                        playRadioStream(
                                            songs[currentSongIndex]);
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: limitNext
                                        ? const Icon(
                                            Icons.skip_next,
                                            color: Colors.white38,
                                          )
                                        : const Icon(
                                            Icons.skip_next,
                                            color: Colors.white,
                                          ),
                                    onPressed: playNextSong,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: RawScrollbar(
                      thumbVisibility: true,
                      // thumbVisibility: true, //always show scrollbar
                      thickness: 5, //width of scrollbar
                      thumbColor: Colors.white,
                      radius: Radius.circular(20), //corner radius of scrollbar
                      scrollbarOrientation: ScrollbarOrientation
                          .right, //which side to show scrollbar
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: SoundEffect(),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
