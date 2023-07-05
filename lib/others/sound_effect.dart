import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SoundEffect extends StatefulWidget {
  const SoundEffect({super.key});

  @override
  State<SoundEffect> createState() => _SoundEffectState();
}

class _SoundEffectState extends State<SoundEffect> {
  late AudioPlayer trafficSoundPlayer;
  late AudioPlayer peopleSoundPlayer;
  late AudioPlayer keyboardSoundPlayer;
  late AudioPlayer rainSoundPlayer;

  final String trafficSound = "assets/music/traffic.mp3";
  final String peopleSound = "assets/music/people_talking.mp3";
  final String keyboardSound = "assets/music/keyboard.mp3";
  final String rainSound = "assets/music/rain.mp3";

  double trafficVolume = 0;
  double peopleVolume = 0;
  double keyboardVolume = 0;
  double rainVolume = 0;
  @override
  void initState() {
    super.initState();
    trafficSoundPlayer = AudioPlayer();
    peopleSoundPlayer = AudioPlayer();
    keyboardSoundPlayer = AudioPlayer();
    rainSoundPlayer = AudioPlayer();

    playTrafficSound();
    playPeopleSound();
    playKeyboardSound();
    playRainSound();
  }

  @override
  void dispose() {
    super.dispose();
    trafficSoundPlayer.dispose();
    peopleSoundPlayer.dispose();
    keyboardSoundPlayer.dispose();
    rainSoundPlayer.dispose();
  }

  void playTrafficSound() async {
    await trafficSoundPlayer.setAsset(trafficSound);
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
    await peopleSoundPlayer.setAsset(peopleSound);
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

  void playKeyboardSound() async {
    await keyboardSoundPlayer.setAsset(keyboardSound);
    keyboardSoundPlayer.setVolume(keyboardVolume);
    keyboardSoundPlayer.setLoopMode(LoopMode.one);
    keyboardSoundPlayer.play();
  }

  void changeKeyboardVolume(double value) {
    keyboardSoundPlayer.setVolume(value);
    setState(() {
      keyboardVolume = value;
    });
  }

  void playRainSound() async {
    await rainSoundPlayer.setAsset(rainSound);
    rainSoundPlayer.setVolume(rainVolume);
    rainSoundPlayer.setLoopMode(LoopMode.one);
    rainSoundPlayer.play();
  }

  void changeRainVolume(double value) {
    rainSoundPlayer.setVolume(value);
    setState(() {
      rainVolume = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          height: 3,
                          width: 3,
                        ),
                        Icon(
                          Icons.traffic,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(
                          height: 2,
                          width: 2,
                        ),
                        Text(
                          'Traffic Driving',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Slider(
                    value: trafficVolume,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) {
                      changeTrafficVolume(value);
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.white30,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          height: 3,
                          width: 3,
                        ),
                        Icon(
                          Icons.people_alt,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(
                          height: 2,
                          width: 2,
                        ),
                        Text(
                          'People Talking',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Slider(
                    value: peopleVolume,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) {
                      changePeopleVolume(value);
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.white30,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          height: 3,
                          width: 3,
                        ),
                        Icon(
                          Icons.keyboard,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(
                          height: 2,
                          width: 2,
                        ),
                        Text(
                          'Keyboard',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Slider(
                    value: keyboardVolume,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) {
                      changeKeyboardVolume(value);
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.white30,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(
                          height: 3,
                          width: 3,
                        ),
                        Icon(
                          Icons.umbrella,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(
                          height: 2,
                          width: 2,
                        ),
                        Text(
                          'Rain',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Slider(
                    value: rainVolume,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) {
                      changeRainVolume(value);
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.white30,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
