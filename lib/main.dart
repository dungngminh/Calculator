import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'main_screen.dart';

void main() => runApp(MaterialApp(
      title: "Máy tính",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    ));

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: MainScreen(),
      image: Image.asset(
        "assets/icon/launch_image.jpg",
        fit: BoxFit.cover,
      ),
      title: Text(
        "Máy tính",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      photoSize: 100.0,
      useLoader: false,
    );
  }
}
