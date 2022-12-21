import 'package:flutter/material.dart';

// import 'home_screen.dart';
import 'instagram_effect/instagram_effect.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const InstagramEffect(),
      // HomeScreen()
    );
  }
}
