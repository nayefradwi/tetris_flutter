import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class SBlock extends Tetromino {
  SBlock() : super(const Color(0xff00FFFF), [5, 6, 14, 15]);

  @override
  List<int>? rotate() {
    // TODO: implement rotate
    throw UnimplementedError();
  }
}
