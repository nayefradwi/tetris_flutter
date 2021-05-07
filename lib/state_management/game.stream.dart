import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/Models/iblock.tetromino.dart';
import 'package:tetris/Models/jblock.tetromino.dart';
import 'package:tetris/Models/lblock.tetromino.dart';
import 'package:tetris/Models/oblock.tetromino.dart';
import 'package:tetris/Models/sblock.tetromino.dart';
import 'package:tetris/Models/tblock.tetromino.dart';
import 'package:tetris/Models/tetromino.abstract.dart';
import 'package:tetris/Models/zblock.tetromino.dart';
import 'package:tetris/UI/pixel.widget.dart';
import 'package:tetris/state_management/game.events.dart';

class GameStream {
  GameStream._();
  static GameStream _$ = GameStream._();
  factory GameStream.get() => _$;
  final StreamController<GameEvents> _gameStreamController =
      StreamController<GameEvents>.broadcast();
  bool hasGameStarted = false;
  List<PixelWidget> pixels = [];
  List<Tetromino> tetrominos = [
    JBlock(),
    OBlock(),
    ZBlock(),
    SBlock(),
    TBlock(),
    IBlock(),
    LBlock()
  ];

  Random _random = Random();
  late Tetromino nextTetromino;
  List<int> _landedPixels = [];
  Stream<GameEvents> get gameStreamSubscription => _gameStreamController.stream;
  Duration gameDifficulty = Duration(milliseconds: 1000);
  void init() {
    nextTetromino = _getRandomTetromino();
    for (int i = 0; i < 200; i++)
      pixels.add(PixelWidget(
        // colorColors.white10,
        number: i,
      ));
  }

  _gameLoop(Tetromino currentTetromino) {
    if (!hasGameStarted) return;
    Timer.periodic(gameDifficulty, (timer) {
      List<int> oldPostions = currentTetromino.moveDown();
      // 1) check if landed
      if (checkIfLanded(currentTetromino)) {
        print("landed");
        // a) check if clear row
        // b) check if game ended
        currentTetromino = _getRandomTetromino();
        timer.cancel();
        _gameLoop(currentTetromino);
      }

      // 2) clear previous row
      for (int i in oldPostions) {
        pixels[i] = PixelWidget(
          color: Colors.white10,
        );
      }

      // 3) set new pixels
      _displayTetromino(currentTetromino);
    });
  }

  void startGame() {
    hasGameStarted = true;
    _displayTetromino(nextTetromino);
    _gameLoop(nextTetromino);
    _gameStreamController.sink.add(GameStartedEvent());
  }

  void endGame() {
    hasGameStarted = false;
    _gameStreamController.sink.add(GameEndedEvent());
  }

  void dispose() {
    _gameStreamController.close();
  }

  Tetromino _getRandomTetromino() {
    int index = _random.nextInt(tetrominos.length);
    return tetrominos[index];
  }

  bool checkIfLanded(Tetromino current) {
    List<int> positions = [...current.pixelPositions];
    positions.sort((b, a) => a.compareTo(b));
    print(positions);
    print(positions[0] / 10);
    if (positions[0] / 10 == 19) return true;
    return false;
  }

  void _displayTetromino(Tetromino nextTetromino) {
    for (int i in nextTetromino.pixelPositions) {
      pixels[i] = PixelWidget(
        color: nextTetromino.color,
      );
    }
    _gameStreamController.sink.add(UpdateGameBoardEvent());
  }
}
