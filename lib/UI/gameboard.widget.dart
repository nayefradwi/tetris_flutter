import 'package:flutter/material.dart';
import 'package:tetris/UI/pixel.widget.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<PixelWidget> pixels = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 200; i++)
      pixels.add(PixelWidget(
        Colors.white10,
        number: i,
      ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10),
      child: GridView.count(
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: (size.height / size.width * 0.65),
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 10,
        children: pixels,
      ),
    );
  }
}
