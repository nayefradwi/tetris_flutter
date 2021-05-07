import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class JBlock extends Tetromino {
  JBlock() : super(const Color(0xff7030A0), [5, 15, 25, 24]);

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
