import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class SBlock extends Tetromino {
  SBlock() : super(const Color(0xff00FFFF), [4, 5, 13, 14]);
  List<List<int>> _rotations = [
    [4, 5, 13, 14],
    [4, 14, 15, 25],
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
      if (currentRotationIndex == 0 && x[0] < 1)
        a = a + xOffset + 1;
      else
        a = a + xOffset;
      newPositions.add(a);
    }
    pixelPositions.clear();
    pixelPositions.addAll(newPositions);
    return old;
  }
}
