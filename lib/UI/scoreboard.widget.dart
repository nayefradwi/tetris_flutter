import 'package:flutter/material.dart';
import 'package:tetris/state_management/game.events.dart';
import 'package:tetris/state_management/game.stream.dart';

class ScoreBoardWidget extends StatefulWidget {
  @override
  _ScoreBoardWidgetState createState() => _ScoreBoardWidgetState();
}

class _ScoreBoardWidgetState extends State<ScoreBoardWidget> {
  GameStream _gameStream = GameStream.get();
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
                    height: 55,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff131313)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: StreamBuilder<GameEvents>(
                            stream: _gameStream.gameStreamSubscription.where(
                                (event) => event is UpdateNextWidgetEvent),
                            builder: (context, snapshot) {
                              print("built");
                              return Column(
                                children: [
                                  Expanded(
                                    child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: _gameStream.nextPixels.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 0.75,
                                              crossAxisCount: 10,
                                              crossAxisSpacing: 1,
                                              mainAxisSpacing: 1),
                                      itemBuilder: (context, index) {
                                        return _gameStream.nextPixels[index];
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }),
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
