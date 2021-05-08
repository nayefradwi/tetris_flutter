import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/Models/tetromino.abstract.dart';
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
  List<Function> tetrominos = [
    Tetromino.iblock,
    Tetromino.jblock,
    Tetromino.sblock,
    Tetromino.lblock,
    Tetromino.oblock,
    Tetromino.tblock,
    Tetromino.zblock
  ];

  Random _random = Random();
  late Tetromino nextTetromino;
  late Tetromino _currentTetromino;
  List<int> _landedPixels = [];
  Stream<GameEvents> get gameStreamSubscription => _gameStreamController.stream;
  Duration gameDifficulty = Duration(milliseconds: 150);

  void init() {
    nextTetromino = _getRandomTetromino();
    for (int i = 0; i < 200; i++) pixels.add(PixelWidget());
  }

  _gameLoop(Tetromino currentTetromino) {
    if (!hasGameStarted) return;
    _currentTetromino = currentTetromino;
    Timer.periodic(gameDifficulty, (timer) {
      if (checkIfLanded(currentTetromino)) {
        _displayTetromino(currentTetromino);
        _landedPixels.addAll(currentTetromino.pixelPositions);

        // a) clear row
        List<int> rowsLanded =
            _landedPixels.map<int>((e) => (e / 10).floor()).toList();
        Map<int, int> count = {};
        rowsLanded.forEach(
            (i) => count[i] = count.containsKey(i) ? count[i]! + 1 : 1);

        List<int> rowsToDelete = [];
        for (MapEntry<int, int> entry in count.entries) {
          if (entry.value == 10) rowsToDelete.add(entry.key);
        }
        if (rowsToDelete.isNotEmpty) deleteRows(rowsToDelete, rowsLanded);

        // b) check if game ended

        currentTetromino = _getRandomTetromino();
        timer.cancel();
        _gameLoop(currentTetromino);
      } else {
        List<int> oldPositions = currentTetromino.moveDown();

        // 2) clear previous row
        _clearOldPositions(oldPositions);

        // 3) set new pixels
        _displayTetromino(currentTetromino);
      }
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

  void moveLeft() {
    List<int> oldPositions = _currentTetromino.moveLeft();
    _clearOldPositions(oldPositions);
    _displayTetromino(_currentTetromino);
  }

  void moveRight() {
    List<int> oldPositions = _currentTetromino.moveRight();
    _clearOldPositions(oldPositions);
    _displayTetromino(_currentTetromino);
  }

  void dispose() {
    _gameStreamController.close();
  }

  Tetromino _getRandomTetromino() {
    int index = _random.nextInt(tetrominos.length);
    return tetrominos[index]();
  }

  bool checkIfLanded(Tetromino current) {
    List<int> positions = [...current.pixelPositions];
    List<int> positions2 =
        current.pixelPositions.map<int>((e) => e + 10).toList();
    positions.sort((b, a) => a.compareTo(b));
    if ((positions[0] / 10).floor() == 19 ||
        positions2.any((item) => _landedPixels.contains(item))) return true;
    return false;
  }

  void _clearOldPositions(oldPositions) {
    for (int i in oldPositions) {
      pixels[i] = PixelWidget(
        color: Colors.white10,
      );
    }
  }

  void _displayTetromino(Tetromino nextTetromino) {
    for (int i in nextTetromino.pixelPositions) {
      pixels[i] = PixelWidget(
        color: nextTetromino.color,
      );
    }
    _gameStreamController.sink.add(UpdateGameBoardEvent());
  }

  void deleteRows(List<int> rowsToDelete, List<int> rows) {
    List<int> old = [..._landedPixels];

    // delete each row
    for (int i = 0; i < rowsToDelete.length; i++) {
      for (int ii = rowsToDelete[i] * 10;
          ii < (rowsToDelete[i] + 1) * 10;
          ii++) {
        pixels[ii] = PixelWidget();
        _landedPixels.remove(ii);
      }
    }

    // remove landed pixels
    _landedPixels = _landedPixels.map<int>((e) {
      return e + 10 * rowsToDelete.length;
    }).toList();

    // shift dowm
    old.sort((b, a) => a.compareTo(b));
    List<PixelWidget> pixelsBefore = [...pixels];
    for (int i = 0; i < rows.length; i++) {
      for (int ii = rows[i] * 10; ii < (rows[i] + 1) * 10; ii++) {
        pixels[ii] = pixelsBefore[ii - 10 * rowsToDelete.length];
      }
    }
  }
}
