import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xylophone/xylophone_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(([DeviceOrientation.landscapeLeft]));
    return MaterialApp(
      title: 'XylophoneApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const XylophoneApp(),
    );
  }
}
