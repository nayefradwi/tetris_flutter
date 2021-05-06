import 'package:flutter/material.dart';

class PixelWidget extends StatefulWidget {
  final Color color;
  final int? number;
  const PixelWidget(
    this.color, {
    Key? key,
    this.number,
  }) : super(key: key);

  @override
  _PixelWidgetState createState() => _PixelWidgetState();
}

class _PixelWidgetState extends State<PixelWidget> {
  @override
  Widget build(BuildContext context) {
    // height of each pixel = 0.05 original height
    // width =
    // var size = MediaQuery.of(context).size;
    // print(size.width);
    // print(size.height);
    return Container(
      color: Colors.white10,
      child: Visibility(
          visible: widget.number != null,
          child: Center(child: Text(widget.number.toString()))),
    );
  }
}
