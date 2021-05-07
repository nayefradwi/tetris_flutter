import 'package:flutter/material.dart';

abstract class Tetromino {
  static const OBLOCK = 0;
  final Color color;
  final List<int> pixelPositions;
  final String? imageAsset;
  const Tetromino(this.color, this.pixelPositions, {this.imageAsset});
  List<int>? moveRight();
  List<int>? moveLeft();
  List<int>? rotate();
}
