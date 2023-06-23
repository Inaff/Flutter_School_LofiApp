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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  'Traffic Sound',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Slider(
                  value: trafficVolume,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (value) {
                    changeTrafficVolume(value);
                  },
                  activeColor: Colors.cyanAccent,
                  inactiveColor: Colors.blueGrey,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  'People Talking',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Slider(
                  value: peopleVolume,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (value) {
                    changePeopleVolume(value);
                  },
                  activeColor: Colors.cyanAccent,
                  inactiveColor: Colors.blueGrey,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  'Keyboard',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Slider(
                  value: keyboardVolume,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (value) {
                    changeKeyboardVolume(value);
                  },
                  activeColor: Colors.cyanAccent,
                  inactiveColor: Colors.blueGrey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
            width: 20,
          )
        ],
      ),
    );
  }
}
