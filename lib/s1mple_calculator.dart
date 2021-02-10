import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'scientific_calculator.dart';

class S1mpleCalculator extends StatefulWidget {
  @override
  _S1mpleCalculatorState createState() => _S1mpleCalculatorState();
}

class _S1mpleCalculatorState extends State<S1mpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";

  double equationSize = 45;
  double resultSize = 55;

  funcButton(String textButton) {
    setState(() {
      if (textButton == "C") {
        equationSize = 45;
        resultSize = 55;
        equation = "0";
        result = "0";
      } else if (textButton == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
          equationSize = 45;
          resultSize = 55;
        }
      } else if (textButton == "=") {
        equationSize = 45;
        resultSize = 55;
        expression = equation;
        //Chuyển x, ÷, % về các dạng đúng của phương trình
        expression = expression.replaceAll("x", "*");
        expression = expression.replaceAll("÷", "/");
        expression = expression.replaceAll("%", "/100");
        //Trình phân tích cú pháp tạo một [Biểu thức] toán học từ một chuỗi đầu vào nhất định.
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          //Mô hình ngữ cảnh theo dõi tất cả các biến và hàm đã biết.
          ContextModel contextModel = ContextModel();
          //Trả kết quả đổi về kiểu REAL
          result = "${exp.evaluate(EvaluationType.REAL, contextModel)}";
        } catch (e) {
          result = "Lỗi";
        }
      } else {
        equationSize = 55;
        resultSize = 45;
        if (equation == "0")
          equation = textButton;
        else
          equation += textButton;
      }
    });
  }

  Widget keyButton(
      String textButton, double heightOfButton, Color colorButton) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * heightOfButton,
      color: colorButton,
      child: TextButton(
        onPressed: () {
          funcButton(textButton);
        },
        child: Text(
          textButton,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Máy tính cơ bản"),
      ),
      drawer: typeOfCalculator(),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 18, 10, 0),
            child: Text(
              equation,
              style: TextStyle(
                fontSize: equationSize,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Text(
              result,
              style: TextStyle(
                fontSize: resultSize,
              ),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        keyButton("C", 1, Colors.orange[700]),
                        keyButton("⌫", 1, Colors.blue),
                        keyButton("%", 1, Colors.blue),
                        keyButton("÷", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        keyButton("7", 1, Colors.black38),
                        keyButton("8", 1, Colors.black38),
                        keyButton("9", 1, Colors.black38),
                        keyButton("x", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        keyButton("4", 1, Colors.black38),
                        keyButton("5", 1, Colors.black38),
                        keyButton("6", 1, Colors.black38),
                        keyButton("-", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        keyButton("1", 1, Colors.black38),
                        keyButton("2", 1, Colors.black38),
                        keyButton("3", 1, Colors.black38),
                        keyButton("+", 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        keyButton("00", 1, Colors.black38),
                        keyButton("0", 1, Colors.black38),
                        keyButton(".", 1, Colors.black38),
                        keyButton("=", 1, Colors.redAccent),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        keyButton("0", 1, Colors.black),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget typeOfCalculator() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
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
                        color: Colors.black,),
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
              "Máy tính khoa học",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ScientificCalculator()));
            },
          ),
        ],
      ),
    );
  }
}
