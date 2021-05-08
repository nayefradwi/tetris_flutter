import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class ZBlock extends Tetromino {
  ZBlock() : super(const Color(0xffFF0000), [4, 5, 15, 16]);

  @override
  List<int> rotateNext() {
    // TODO: implement rotateNext
    throw UnimplementedError();
  }

  @override
  List<int> rotatePrevious() {
    // TODO: implement rotatePrevious
    throw UnimplementedError();
  }
}
