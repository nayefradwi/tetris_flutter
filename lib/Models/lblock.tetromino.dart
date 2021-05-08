import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class LBlock extends Tetromino {
  LBlock() : super(const Color(0xff70AD47), [4, 14, 24, 25]);

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
