import 'dart:async';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class XylophoneViewModel {
  final Soundpool pool =
      Soundpool.fromOptions(options: SoundpoolOptions.kDefault);
  final List<int> soundIds = [];
  final StreamController<bool> _isLoadingController = StreamController<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void init() {
    _loadSounds();
  }

  Future<void> _loadSounds() async {
    _isLoadingController.add(true);
    int soundId = await rootBundle
        .load('assets/do1.wav')
        .then((soundData) => pool.load(soundData));

    soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/re.wav')
        .then((soundData) => pool.load(soundData));

    soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/mi.wav')
        .then((soundData) => pool.load(soundData));

    soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/fa.wav')
        .then((soundData) => pool.load(soundData));

    soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/sol.wav')
        .then((soundData) => pool.load(soundData));

    soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/la.wav')
        .then((soundData) => pool.load(soundData));

    soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/si.wav')
        .then((soundData) => pool.load(soundData));

    soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/do2.wav')
        .then((soundData) => pool.load(soundData));

    soundIds.add(soundId);

    _isLoadingController.add(false);
  }

  void playSound(int soundId) {
    pool.play(soundId);
  }

  void dispose() {
    pool.dispose();
    _isLoadingController.close();
  }
}
