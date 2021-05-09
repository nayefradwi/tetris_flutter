import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class TBlock extends Tetromino {
  TBlock() : super(const Color(0xffED7D31), [14, 23, 24, 25]);
  List<List<int>> _rotations = [
    [14, 23, 24, 25],
    [34, 23, 24, 25],
  ];

  @override
  List<int> rotateNext() {
    currentRotationIndex = (currentRotationIndex + 1) % _rotations.length;
    List<int> old = [...pixelPositions];
    List<int> newPositions = [];
    newPositions.addAll(old);
    newPositions[0] =
        currentRotationIndex == 0 ? newPositions[0] - 20 : newPositions[0] + 20;

    pixelPositions.clear();
    pixelPositions.addAll(newPositions);
    return old;
  }
}
