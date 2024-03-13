import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suppermario/screens/home.dart';

void main() {
  runApp(superMario());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
}

class superMario extends StatelessWidget {
  const superMario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}
