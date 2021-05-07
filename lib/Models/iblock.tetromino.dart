import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class IBlock extends Tetromino {
  IBlock() : super(const Color(0xff4472C4), [4, 14, 24, 34]);

  @override
  List<int>? rotate() {
    throw UnimplementedError();
  }
}
