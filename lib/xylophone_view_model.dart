import 'dart:async';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class XylophoneViewModel {
  final Soundpool _pool =
      Soundpool.fromOptions(options: SoundpoolOptions.kDefault);
  final List<int> _soundIds = [];


  Future<void> loadSounds() async {
    int soundId = await rootBundle
        .load('assets/do1.wav')
        .then((soundData) => _pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/re.wav')
        .then((soundData) => _pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/mi.wav')
        .then((soundData) => _pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/fa.wav')
        .then((soundData) => _pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/sol.wav')
        .then((soundData) => _pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/la.wav')
        .then((soundData) => _pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/si.wav')
        .then((soundData) => _pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/do2.wav')
        .then((soundData) => _pool.load(soundData));

    _soundIds.add(soundId);
  }

  void playDo() {
    _playSound(_soundIds[0]);
  }
  void playRe() {
    _playSound(_soundIds[1]);
  }
  void playMi() {
    _playSound(_soundIds[2]);
  }

  void _playSound(int soundId) {
    _pool.play(soundId);
  }

  void dispose() {
    _pool.dispose();
  }
}
