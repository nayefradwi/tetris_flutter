import 'dart:ui';

import 'package:tetris/Models/tetromino.abstract.dart';

class IBlock extends Tetromino {
  IBlock() : super(const Color(0xff4472C4), [4, 14, 24, 34]);
  // List<List<int>> _rotations = [
  //   [4, 14, 24, 34],
  //   [23, 24, 25, 26],
  //   [5, 15, 25, 35],
  //   [23, 24, 25, 26],
  // ];
  // int _currentRotationIndex = 0;
  @override
  List<int> rotateNext() {
    List<int> old = [...pixelPositions];
    // get center piece
    int sum = 0;
    // for (int i = 0; i < pixelPositions.length; i++) {
    //   pixelPositions[i] = _rotations[++_currentRotationIndex][i];
    // }
    return old;
  }

// offset from x axis (%10) +
  @override
  List<int> rotatePrevious() {
    List<int> old = [...pixelPositions];
    // pixelPositions.clear();
    // pixelPositions.addAll(_rotations[++_currentRotationIndex]);
    return old;
  }
}
