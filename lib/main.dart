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
  String opp ="";
  String result = "";
  String text= "";
  void buttonClicked(String btnText) {
    if (btnText == "C") {
      opp ="";
      result="";
      text = "";
      first = 0;
      second = 0;
    } else {
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
              color: Colors.yellow,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(10),
              child: Text(
                text.isEmpty ? "0" : text,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Row(
            children: [
              customOutlineButton("9"),
              customOutlineButton("8"),
              customOutlineButton("7"),
              customOutlineButton("+")
            ],
          ),
          Row(
            children: [
              customOutlineButton("6"),
              customOutlineButton("5"),
              customOutlineButton("4"),
              customOutlineButton("-")

            ],
          ),
          Row(
            children: [
              customOutlineButton("3"),
              customOutlineButton("2"),
              customOutlineButton("1"),
              customOutlineButton("x"),

            ],
          ),
          Row(
            children: [
              customOutlineButton("C"),
              customOutlineButton("0"),
              customOutlineButton("="),
              customOutlineButton("/"),
            ],
          )


        ],
      ),
    );
  }
}
