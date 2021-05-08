import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class TBlock extends Tetromino {
  TBlock() : super(const Color(0xffED7D31), [5, 14, 15, 16]);

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
