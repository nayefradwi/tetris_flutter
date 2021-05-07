import 'dart:async';

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
  Stream<GameEvents> get gameStreamSubscription => _gameStreamController.stream;

  void init() {
    for (int i = 0; i < 200; i++)
      pixels.add(PixelWidget(
        // colorColors.white10,
        number: i,
      ));
  }

  void startGame() {}
  void endGame() {}
  void dispose() {
    _gameStreamController.close();
  }
}
