import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(colors: [
          Colors.tealAccent,
          Colors.redAccent,
          Colors.black,
          Colors.blueAccent,
          Colors.white,
        ]),
      ),
    );
  }
}
