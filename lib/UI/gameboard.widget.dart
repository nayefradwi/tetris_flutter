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
    return GestureDetector(
      child: Container(
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: pixels.length,
          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.25,
              crossAxisCount: 10,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3),
          itemBuilder: (context, index) {
            return pixels[index];
          },
        ),
      ),
    );
  }
}
