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
  const Tetromino(this.color, this.pixelPositions, {this.imageAsset});
  List<int>? rotate();
  List<int> moveDown() {
    List<int> oldPositions = [...pixelPositions];
    for (int i = 0; i < pixelPositions.length; i++) pixelPositions[i] += 10;
    return oldPositions;
  }
}
