import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class SBlock extends Tetromino {
  SBlock() : super(const Color(0xff00FFFF), [5, 6, 14, 15]);

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
