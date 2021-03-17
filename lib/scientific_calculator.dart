import 'package:flutter/material.dart';
import 's1mple_calculator.dart';

class ScientificCalculator extends StatefulWidget {
  @override
  _ScientificCalculatorState createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Máy tính khoa học"),
      ),
      drawer: typeOfCalculator(),
      body: Column(),
    );
  }

  Widget typeOfCalculator() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Text(
                    "Máy tính",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "của dtp",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            enabled: true,
            title: Text(
              "Máy tính cơ bản",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => S1mpleCalculator()));
            },
          ),
          ListTile(
            enabled: true,
            title: Text(
              "Máy tính nhu l",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScientificCalculator()));
            },
          ),
        ],
      ),
    );
  }
}
