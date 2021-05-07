import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class TBlock extends Tetromino {
  TBlock() : super(const Color(0xffED7D31), [5, 14, 15, 16]);

  @override
  List<int>? rotate() {
    // TODO: implement rotate
    throw UnimplementedError();
  }
}
