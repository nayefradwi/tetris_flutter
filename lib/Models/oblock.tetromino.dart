import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class OBlock extends Tetromino {
  OBlock() : super(const Color(0xffFFC000), [4, 5, 14, 15]);

  @override
  List<int> rotateNext() {
    return [...pixelPositions];
  }
}
