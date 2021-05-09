import 'package:flutter/material.dart';
import 'package:tetris/state_management/game.stream.dart';

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
                  child: SizedBox(
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff131313)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: GridView.count(
                                  crossAxisCount: 8,
                                  children: GameStream.get().nextPixels,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
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
