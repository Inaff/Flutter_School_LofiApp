import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AudioPlayer audioPlayer;
  late AudioPlayer trafficSoundPlayer;
  late AudioPlayer peopleSoundPlayer;
  bool isPlaying = false;
  double volume = 1.0;
  bool isMuted = false;
  double previousVolume = 1.0;

  final List<String> songs = [
    "https://kathy.torontocast.com:3350/;",
    "https://streaming.wkar.msu.edu/wkar-jazz"
  ];
  int currentSongIndex = 0;

  final String trafficSoundUrl = "https://streaming.wkar.msu.edu/wkar-jazz";
  final String peopleSoundUrl = "https://streaming.wkar.msu.edu/wkar-jazz";

  double trafficVolume = 1.0;
  double peopleVolume = 1.0;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    trafficSoundPlayer = AudioPlayer();
    peopleSoundPlayer = AudioPlayer();

    playRadioStream(songs[currentSongIndex]);
    playTrafficSound();
    playPeopleSound();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    trafficSoundPlayer.dispose();
    peopleSoundPlayer.dispose();
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
    await audioPlayer.setUrl(url);
    audioPlayer.play();
    setState(() {
      isPlaying = true;
    });
  }

  void stopRadioStream() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  void playNextSong() {
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

  void playTrafficSound() async {
    await trafficSoundPlayer.setUrl(trafficSoundUrl);
    trafficSoundPlayer.setVolume(trafficVolume);
    trafficSoundPlayer.setLoopMode(LoopMode.one);
    trafficSoundPlayer.play();
  }

  void changeTrafficVolume(double value) {
    trafficSoundPlayer.setVolume(value);
    setState(() {
      trafficVolume = value;
    });
  }

  void playPeopleSound() async {
    await peopleSoundPlayer.setUrl(peopleSoundUrl);
    peopleSoundPlayer.setVolume(peopleVolume);
    peopleSoundPlayer.setLoopMode(LoopMode.one);
    peopleSoundPlayer.play();
  }

  void changePeopleVolume(double value) {
    peopleSoundPlayer.setVolume(value);
    setState(() {
      peopleVolume = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lofi App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 0, 0, 0),
                  image: DecorationImage(
                    image: AssetImage('assets/image/background_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Lofi Radio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                              color: Colors.white,
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
                        inactiveColor: Colors.grey,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
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
                              color: Colors.white,
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
                        color: Colors.white,
                      ),
                      onPressed: playNextSong,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Traffic Sound',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: trafficVolume,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (value) {
                          changeTrafficVolume(value);
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'People Talking',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: peopleVolume,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (value) {
                          changePeopleVolume(value);
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
