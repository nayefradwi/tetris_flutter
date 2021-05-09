import 'package:flutter/material.dart';
import 'package:tetris/Models/iblock.tetromino.dart';
import 'package:tetris/Models/jblock.tetromino.dart';
import 'package:tetris/Models/lblock.tetromino.dart';
import 'package:tetris/Models/oblock.tetromino.dart';
import 'package:tetris/Models/sblock.tetromino.dart';
import 'package:tetris/Models/tblock.tetromino.dart';
import 'package:tetris/Models/zblock.tetromino.dart';

abstract class Tetromino {
  static oblock() => OBlock();
  static sblock() => SBlock();
  static jblock() => JBlock();
  static lblock() => LBlock();
  static zblock() => ZBlock();
  static iblock() => IBlock();
  static tblock() => TBlock();
  final Color color;
  final List<int> pixelPositions;
  final String? imageAsset;
  Tetromino(this.color, this.pixelPositions, {this.imageAsset});
  int xOffset = 0;
  int currentRotationIndex = 0;
  List<int> rotateNext();
  List<int> moveDown() {
    List<int> oldPositions = [...pixelPositions];
    for (int i = 0; i < pixelPositions.length; i++) pixelPositions[i] += 10;
    return oldPositions;
  }

  List<int> moveRight() {
    List<int> oldPositions = [...pixelPositions];
    for (int i = 0; i < pixelPositions.length; i++) {
      if (pixelPositions[i] % 10 == 9) {
        pixelPositions.clear();
        pixelPositions.addAll([...oldPositions]);
        return oldPositions;
      }
      pixelPositions[i]++;
    }
    xOffset++;
    return oldPositions;
  }

  List<int> moveLeft() {
    List<int> oldPositions = [...pixelPositions];
    for (int i = 0; i < pixelPositions.length; i++) {
      if (pixelPositions[i] % 10 == 0) {
        pixelPositions.clear();
        pixelPositions.addAll([...oldPositions]);
        return oldPositions;
      }
      pixelPositions[i]--;
    }
    xOffset--;
    return oldPositions;
  }

  int medianIndex(List<int> a) {
    var middle = a.length ~/ 2;
    return middle - 1;
  }
}
