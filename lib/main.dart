import 'package:flutter/material.dart';
import 's1mple_calculator.dart';

void main() => runApp(Calculator());
class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Máy tính",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: S1mpleCalculator(),
    );}
}