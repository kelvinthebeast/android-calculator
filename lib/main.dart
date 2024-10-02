import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false, // Disable debug banner
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int first = 0;
  int second = 0;
  String opp = "";
  String result = "";
  String text = "";

void buttonClicked(String btnText) {
  if (btnText == "C") {
    opp = "";
    result = "";
    text = "";
    first = 0;
    second = 0;
  } 

  else if (btnText == "+" || btnText == "-" || btnText == "x" || btnText == "/") {
    first = int.parse(text);
    opp = btnText;
    result = "";
  } 

  else if (btnText == "=") {
    second = int.parse(text);
    if (opp == "+") {
      result = (first + second).toString();
    } 
    else if (opp == "-") {
      result = (first - second).toString();
    } 
    else if (opp == "x") {
      result = (first * second).toString();
    } 
    else if (opp == "/") {
      result = (first ~/ second).toString(); 
    }
  }

  else if (btnText == "%") {
    result = (int.parse(text) / 100).toString();
  } 

  else if (btnText == "+/-") {
    result = (int.parse(text) * -1).toString(); 
  } 

  else {
    result = int.parse(text + btnText).toString();
  }
  
  setState(() {
    text = result;
  });
}

  Widget customOutlineButton(String value) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonClicked(value),
        style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(15)),
        child: Text(
          value,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CALCULATOR APP")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(10),
              child: Text(
                text.isEmpty ? "0" : text,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            children: [
              customOutlineButton("C"),
              customOutlineButton("()"),
              customOutlineButton("%"),
              customOutlineButton("/")
            ],
          ),
          Row(
            children: [
              customOutlineButton("7"),
              customOutlineButton("8"),
              customOutlineButton("9"),
              customOutlineButton("x")
            ],
          ),
          Row(
            children: [
              customOutlineButton("4"),
              customOutlineButton("5"),
              customOutlineButton("6"),
              customOutlineButton("-")
            ],
          ),
          Row(
            children: [
              customOutlineButton("1"),
              customOutlineButton("2"),
              customOutlineButton("3"),
              customOutlineButton("+")
            ],
          ),
          Row(
            children: [
              customOutlineButton("+/-"),
              customOutlineButton("0"),
              customOutlineButton(","),
              customOutlineButton("="),
            ],
          )
        ],
      ),
    );
  }
}
