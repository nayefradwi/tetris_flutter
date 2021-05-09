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
              if (_gameStream.hasGameStarted) _gameStream.rotateNext();
            },
            onPanEnd: (details) {
              if (details.velocity.pixelsPerSecond.dx > 0) {
                // swiped right so move right
                if (_gameStream.hasGameStarted) _gameStream.moveRight();
              } else if (details.velocity.pixelsPerSecond.dx < 0) {
                // swiped left so move left
                if (_gameStream.hasGameStarted) _gameStream.moveLeft();
              }
            },
            child: Container(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _gameStream.pixels.length,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.91,
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
