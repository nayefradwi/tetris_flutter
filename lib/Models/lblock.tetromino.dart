import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class LBlock extends Tetromino {
  LBlock() : super(const Color(0xff70AD47), [4, 14, 24, 25]);

  @override
  List<int>? rotate() {
    // TODO: implement rotate
    throw UnimplementedError();
  }
}
