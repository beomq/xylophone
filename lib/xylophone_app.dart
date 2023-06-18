import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Soundpool pool = Soundpool.fromOptions(options: SoundpoolOptions.kDefault);

  final List<int> _soundIds = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initSoundPool();
  }

  Future<void> initSoundPool() async {
    int soundId = await rootBundle
        .load('assets/do1.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/re.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/mi.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/fa.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/sol.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/la.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/si.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);
    soundId = await rootBundle
        .load('assets/do2.wav')
        .then((soundData) => pool.load(soundData));

    _soundIds.add(soundId);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('실로폰'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: gunban('도', Colors.red, _soundIds[0]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: gunban('레', Colors.orange, _soundIds[1]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: gunban('미', Colors.yellow, _soundIds[2]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: gunban('파', Colors.green, _soundIds[3]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: gunban('솔', Colors.blue, _soundIds[4]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 56.0),
                  child: gunban('라', Colors.cyan, _soundIds[5]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64.0),
                  child: gunban('시', Colors.purple, _soundIds[6]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 72.0),
                  child: gunban('도', Colors.red, _soundIds[7]),
                ),
              ],
            ),
    );
  }

  Widget gunban(String text, Color color, int soundId) {
    return GestureDetector(
      onTap: () {
        pool.play(soundId);
      },
      child: Container(
        width: 50,
        height: double.infinity,
        color: color,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
