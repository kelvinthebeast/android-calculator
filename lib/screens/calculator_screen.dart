
import 'package:flutter/material.dart';
import '../widgets/calculator_button.dart'; // Import the button widget

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";

  // Handles button presses
  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
      num1 = int.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "=") {
      num2 = int.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "×") {
        _output = (num1 * num2).toString();
      } else if (operand == "÷") {
        if (num2 == 0) {
          _output = "Error"; // Avoid division by zero
        } else {
          _output = (num1 ~/ num2).toString();  // Integer division
        }
      }

      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output = _output + buttonText;
      }
    }

    setState(() {
      output = _output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(child: Divider()),

          // Calculator buttons layout
          Column(
            children: [
              Row(
                children: [
                  CalculatorButton(buttonText: "7", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "8", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "9", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "÷", onPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(buttonText: "4", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "5", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "6", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "×", onPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(buttonText: "1", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "2", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "3", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "-", onPressed: buttonPressed),
                ],
              ),
              Row(
                children: [
                  CalculatorButton(buttonText: "0", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "C", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "=", onPressed: buttonPressed),
                  CalculatorButton(buttonText: "+", onPressed: buttonPressed),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
