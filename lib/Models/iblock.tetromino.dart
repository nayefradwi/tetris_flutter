import 'dart:ui';
import 'package:tetris/Models/tetromino.abstract.dart';

class IBlock extends Tetromino {
  IBlock() : super(const Color(0xff4472C4), [4, 14, 24, 34]);
  List<List<int>> _rotations = [
    [4, 14, 24, 34],
    [4, 5, 6, 7],
  ];

  // which rotation im at

  @override
  List<int> rotateNext() {
    currentRotationIndex = (currentRotationIndex + 1) % _rotations.length;
    List<int> old = [...pixelPositions];
    List<int> x = old.map((e) => ((e / 10).floor() * 10 - e).abs()).toList();
    List<int> y = old.map((e) => (e / 10).floor()).toList();

    List<int> newPositions = [];
    for (int i = 0; i < pixelPositions.length; i++) {
      // modify the rows
      int a = _rotations[currentRotationIndex][i] + y[0] * 10;
      // edge case
      if (x[0] > 6)
        a = a + xOffset - 3;
      else
        // add x - offset
        a = a + xOffset;
      newPositions.add(a);
    }
    pixelPositions.clear();
    pixelPositions.addAll(newPositions);
    return old;
  }
}
