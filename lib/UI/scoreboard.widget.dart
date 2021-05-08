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
                  padding: const EdgeInsets.fromLTRB(8, 3, 8, 8),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff131313)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          "Time:",
          style: TextStyle(
            fontSize: 32,
            color: Color(0xffBB86FC),
            fontFamily: "VT323",
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "20H 60M 32S",
          style: TextStyle(
              fontSize: 22, color: Color(0xffBB86FC), fontFamily: "VT323"),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
