import 'package:flutter/material.dart';
import 'package:xylophone/xylophone_view_model.dart';

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final XylophoneViewModel viewModel = XylophoneViewModel();

  @override
  Widget build(BuildContext context) {
    // 여기를 수정했습니다.
    return Scaffold(
      appBar: AppBar(
        title: const Text('실로폰'),
      ),
      body: FutureBuilder<void>(
        future: viewModel.loadSounds(),
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child:
                    gunban('도', Colors.red, onPress: () => viewModel.playDo()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: gunban('레', Colors.orange,
                    onPress: () => viewModel.playRe()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: gunban(
                  '미',
                  Colors.yellow,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: gunban(
                  '파',
                  Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: gunban(
                  '솔',
                  Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 56.0),
                child: gunban(
                  '라',
                  Colors.cyan,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 64.0),
                child: gunban(
                  '시',
                  Colors.purple,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 72.0),
                child: gunban(
                  '도',
                  Colors.red,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget gunban(String text, Color color, {Function()? onPress}) {
    return GestureDetector(
      onTap: () {
        onPress?.call();
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

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
