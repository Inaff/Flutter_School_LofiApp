import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lofi_application/plugin/sound_effect.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    //Set use initState add wiget
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
      stopRadioStream();
      playRadioStream(songs[currentSongIndex]);
    }
  }

  void playPreviousSong() {
    if (currentSongIndex > 0) {
      currentSongIndex--;
      stopRadioStream();
      playRadioStream(songs[currentSongIndex]);
    }
  }

  void showLoadDialogBox(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Dialog(
          // The background color
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // The loading indicator
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                // Some text
                Text('Loading...')
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
            title: const Text('No Internet Connection'),
            content: const Text(
                'Please check your internet connection and try again.'),
            actions: [
              TextButton(
                child: const Text('OK'),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lofi App',
          style: TextStyle(
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
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
              padding: const EdgeInsets.all(40.0),
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
          const SizedBox(height: 20),
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