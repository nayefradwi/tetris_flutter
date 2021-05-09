import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class ZBlock extends Tetromino {
  ZBlock() : super(const Color(0xffFF0000), [4, 5, 15, 16]);
  List<List<int>> _rotations = [
    [4, 5, 15, 16],
    [6, 15, 16, 25],
  ];
  @override
  List<int> rotateNext() {
    currentRotationIndex = (currentRotationIndex + 1) % _rotations.length;
    List<int> old = [...pixelPositions];
    List<int> y = old.map((e) => (e / 10).floor()).toList();
    List<int> x = old.map((e) => ((e / 10).floor() * 10 - e).abs()).toList();
    List<int> newPositions = [];
    for (int i = 0; i < pixelPositions.length; i++) {
      // modify the rows
      int a = _rotations[currentRotationIndex][i] + y[0] * 10;
      // edge case
      if (currentRotationIndex == 0 && x[3] == 0) {
        a = a + xOffset + 1;
      } else
        a = a + xOffset;
      newPositions.add(a);
    }
    pixelPositions.clear();
    pixelPositions.addAll(newPositions);
    return old;
  }
}
