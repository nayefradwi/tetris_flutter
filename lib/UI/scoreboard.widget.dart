import 'package:flutter/material.dart';

class ScoreBoardWidget extends StatefulWidget {
  @override
  _ScoreBoardWidgetState createState() => _ScoreBoardWidgetState();
}

class _ScoreBoardWidgetState extends State<ScoreBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "next",
                  style: TextStyle(
                      fontSize: 32, color: Colors.black, fontFamily: "VT323"),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    color: Color(0xff131313),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          "Time:",
          style:
              TextStyle(fontSize: 32, color: Colors.white, fontFamily: "VT323"),
          textAlign: TextAlign.center,
        ),
        Text(
          "20H 60M 32S",
          style:
              TextStyle(fontSize: 22, color: Colors.white, fontFamily: "VT323"),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
