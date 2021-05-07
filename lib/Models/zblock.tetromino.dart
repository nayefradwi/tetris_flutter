import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class ZBlock extends Tetromino {
  ZBlock() : super(const Color(0xffFF0000), [4, 5, 15, 16]);

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
