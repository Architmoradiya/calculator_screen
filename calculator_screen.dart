import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String input = "";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        output = "0";
        input = "";
        num1 = 0;
        num2 = 0;
        operator = "";
      } else if (value == "+" || value == "-" || value == "*" || value == "/") {
        num1 = double.tryParse(input) ?? 0;
        operator = value;
        input = "";
      } else if (value == "=") {
        num2 = double.tryParse(input) ?? 0;
        if (operator == "+") {
          output = (num1 + num2).toString();
        } else if (operator == "-") {
          output = (num1 - num2).toString();
        } else if (operator == "*") {
          output = (num1 * num2).toString();
        } else if (operator == "/") {
          output = num2 != 0 ? (num1 / num2).toString() : "Error";
        }
        input = "";
      } else {
        input += value;
        output = input;
      }
    });
  }

  Widget _buildButton(String text, {Color color = Colors.transparent}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _buttonPressed(text),
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 24, color: Colors.white),
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
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                output,
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Divider(),
          Column(
            children: [
              Row(
                children: [
                  _buildButton("C"),
                  _buildButton("+/-"),
                  _buildButton("%"),
                  _buildButton("/"),
                ],
              ),
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("*"),
                ],
              ),
              Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("+"),
                ],
              ),
              Row(
                children: [
                  _buildButton("0"),
                  _buildButton("."),
                  _buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
