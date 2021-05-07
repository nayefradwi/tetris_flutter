import 'package:flutter/material.dart';
import 'package:tetris/state_management/game.stream.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  GameStream _gameStream = GameStream.get();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // need it to rebuild when ever stream gets an event, display a dailog box
    // when game ends
    return StreamBuilder(
        stream: _gameStream.gameStreamSubscription,
        builder: (context, snapshot) {
          return GestureDetector(
            onDoubleTap: () {
              // rotate piece
            },
            onPanUpdate: (details) {
              if (details.delta.dx > 0) {
                // swiped rigth so move right
              } else if (details.delta.dx < 0) {
                // swiped left so move left
              }
            },
            child: Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _gameStream.pixels.length,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.89,
                    crossAxisCount: 10,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3),
                itemBuilder: (context, index) {
                  return _gameStream.pixels[index];
                },
              ),
            ),
          );
        });
  }
}
