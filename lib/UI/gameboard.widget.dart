import 'package:flutter/material.dart';
import 'package:tetris/Models/iblock.tetromino.dart';
import 'package:tetris/Models/jblock.tetromino.dart';
import 'package:tetris/Models/lblock.tetromino.dart';
import 'package:tetris/Models/oblock.tetromino.dart';
import 'package:tetris/Models/sblock.tetromino.dart';
import 'package:tetris/Models/tblock.tetromino.dart';
import 'package:tetris/Models/tetromino.abstract.dart';
import 'package:tetris/Models/zblock.tetromino.dart';
import 'package:tetris/UI/pixel.widget.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool hasGameStarted = false;
  List<PixelWidget> pixels = [];
  List<Tetromino> tetrominos = [
    JBlock(),
    OBlock(),
    ZBlock(),
    SBlock(),
    TBlock(),
    IBlock(),
    LBlock()
  ];
  int count = 0;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 200; i++)
      pixels.add(PixelWidget(
        Colors.white10,
        number: i,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {},
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
          itemCount: pixels.length,
          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.89,
              crossAxisCount: 10,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3),
          itemBuilder: (context, index) {
            return pixels[index];
          },
        ),
      ),
    );
  }
}
