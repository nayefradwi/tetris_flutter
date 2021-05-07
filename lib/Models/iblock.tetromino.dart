import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class IBlock extends Tetromino {
  IBlock() : super(const Color(0xff4472C4), [4, 14, 24, 34]);

  @override
  List<int>? moveLeft() {
    // TODO: implement moveLeft
    throw UnimplementedError();
  }

  @override
  List<int>? moveRight() {
    // TODO: implement moveRight
    throw UnimplementedError();
  }

  @override
  List<int>? rotate() {
    // TODO: implement rotate
    throw UnimplementedError();
  }
}
