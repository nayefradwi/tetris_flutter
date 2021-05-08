import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class JBlock extends Tetromino {
  JBlock() : super(const Color(0xff7030A0), [5, 15, 25, 24]);

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
