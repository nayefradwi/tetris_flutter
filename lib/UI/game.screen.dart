import 'package:flutter/material.dart';
import 'package:tetris/UI/gameboard.widget.dart';
import 'package:tetris/UI/scoreboard.widget.dart';
import 'package:tetris/state_management/game.stream.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameStream _gameStream = GameStream.get();

  @override
  void initState() {
    _gameStream.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131313),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TETRIS",
                    style: TextStyle(
                        fontFamily: "vt323",
                        fontSize: 60,
                        decoration: TextDecoration.combine([
                          TextDecoration.underline,
                          TextDecoration.overline
                        ])),
                  ),
                  TextButton(
                      onPressed: () => _gameStream.startGame(),
                      child: Text("START",
                          style: TextStyle(
                              fontFamily: "vt323",
                              fontSize: 60,
                              decoration: TextDecoration.combine([
                                TextDecoration.underline,
                                TextDecoration.overline
                              ]))))
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // game board, 550 is the max?
                    Expanded(flex: 3, child: GameBoard()),
                    // score board
                    Expanded(child: ScoreBoardWidget())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _gameStream.dispose();
    super.dispose();
  }
}
