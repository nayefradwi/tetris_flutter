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
  List<PixelWidget> nextPixels = [];
  List<Function> tetrominos = [
    Tetromino.lblock,
    Tetromino.jblock,
    Tetromino.sblock,
    Tetromino.zblock,
    Tetromino.tblock,
    Tetromino.oblock,
    Tetromino.iblock
  ];

  Random _random = Random();
  late Tetromino nextTetromino;
  late Tetromino _currentTetromino;
  List<int> _landedPixels = [];
  Stream<GameEvents> get gameStreamSubscription => _gameStreamController.stream;
  Duration gameDifficulty = Duration(milliseconds: 300);
  late Timer _gameTimer;
  void init() {
    nextTetromino = _getRandomTetromino();
    for (int i = 0; i < 200; i++) pixels.add(PixelWidget());
  }

  void _refresh() {
    pixels.clear();
    _landedPixels.clear();
    init();
  }

  void recreateNextPixels({required Tetromino toDisplay}) {
    nextPixels.clear();
    for (int i = 0; i < 64; i++) {
      if (toDisplay.pixelPositions.contains(i)) {
        nextPixels.insert(
            i,
            PixelWidget(
              color: toDisplay.color,
            ));
      } else {
        nextPixels.add(PixelWidget());
      }
    }
    _gameStreamController.sink.add(UpdateNextWidgetEvent());
  }

  _gameLoop(Tetromino currentTetromino) {
    if (!hasGameStarted) return;
    _currentTetromino = currentTetromino;

    _displayTetromino(currentTetromino);
    _gameTimer = Timer.periodic(gameDifficulty, (timer) {
      if (checkIfLanded(currentTetromino)) {
        _displayTetromino(currentTetromino);
        _landedPixels.addAll(currentTetromino.pixelPositions);

        // a) clear row
        List<int> rowsLanded =
            _landedPixels.map<int>((e) => (e / 10).floor()).toList();
        if (rowsLanded.contains(0)) {
          endGame();
          timer.cancel();
        } else {
          Map<int, int> count = {};
          rowsLanded.forEach(
              (i) => count[i] = count.containsKey(i) ? count[i]! + 1 : 1);

          List<int> rowsToDelete = [];
          for (MapEntry<int, int> entry in count.entries) {
            if (entry.value == 10) rowsToDelete.add(entry.key);
          }
          if (rowsToDelete.isNotEmpty) deleteRows(rowsToDelete, 0);

          // b) check if game ended

          currentTetromino = _getRandomTetromino();
          timer.cancel();
          _gameLoop(currentTetromino);
        }
      } else {
        List<int> oldPositions = currentTetromino.moveDown();
        _clearOldPositions(oldPositions);
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
    _gameTimer.cancel();
    _refresh();
  }

  void moveLeft() {
    List<int> oldPositions = _currentTetromino.moveLeft();
    // so they dont move on other pixels
    if (checkIfPixelsOverlapping(oldPositions)) return;
    _clearOldPositions(oldPositions);
    _displayTetromino(_currentTetromino);
  }

  void moveRight() {
    List<int> oldPositions = _currentTetromino.moveRight();
    if (checkIfPixelsOverlapping(oldPositions)) return;
    _clearOldPositions(oldPositions);
    _displayTetromino(_currentTetromino);
  }

  void rotateNext() {
    List<int> oldPositions = _currentTetromino.rotateNext();
    // so they dont rotate on other pixels
    if (checkIfPixelsOverlapping(oldPositions)) return;
    _clearOldPositions(oldPositions);
    _displayTetromino(_currentTetromino);
  }

  void dispose() {
    _gameStreamController.close();
  }

  Tetromino _getRandomTetromino() {
    int index = _random.nextInt(tetrominos.length);
    Tetromino t = tetrominos[index]();
    recreateNextPixels(toDisplay: t);
    return t;
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

  void deleteRows(List<int> rowsToDelete, int index) {
    List<int> landedPixelsSorted = [..._landedPixels];
    List<PixelWidget> pixelsCopy = [...pixels];
    landedPixelsSorted.sort();

    if (index == rowsToDelete.length) {
      return;
    }

    // deleted row pixels
    for (int i = rowsToDelete[index] * 10;
        i < (rowsToDelete[index] + 1) * 10;
        i++) {
      pixels[i] = PixelWidget();
    }

    List<int> rowsLanded =
        landedPixelsSorted.map<int>((e) => (e / 10).floor()).toList();

    // shift down row
    for (int i = rowsLanded[0] * 10; i < rowsToDelete[index] * 10; i++) {
      // shift down pixels
      pixels[i + 10] = pixelsCopy[i];
      pixels[i] = pixelsCopy[i - 10];
    }
    // shift down landed pixels
    for (int i = 0; i < _landedPixels.length; i++) {
      if (rowsLanded[i] >= rowsToDelete[index]) break;
      landedPixelsSorted[i] = landedPixelsSorted[i] + 10;
    }
    _landedPixels = landedPixelsSorted;

    // delete landed pixels
    for (int i = rowsToDelete[index] * 10;
        i < rowsToDelete[index] * 10 + 10;
        i++) {
      _landedPixels.remove(i);
    }
    deleteRows(rowsToDelete, ++index);
  }

  bool checkIfPixelsOverlapping(List<int> oldPositions) {
    for (int i = 0; i < _currentTetromino.pixelPositions.length; i++) {
      if (_landedPixels.contains(_currentTetromino.pixelPositions[i])) {
        _currentTetromino.pixelPositions.clear();
        _currentTetromino.pixelPositions.addAll(oldPositions);
        return true;
      }
    }
    return false;
  }
}
