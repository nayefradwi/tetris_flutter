import 'package:flutter/material.dart';

class PixelWidget extends StatefulWidget {
  final Color? color;
  final int? number;
  const PixelWidget({
    Key? key,
    this.color: Colors.white10,
    this.number,
  }) : super(key: key);

  @override
  _PixelWidgetState createState() => _PixelWidgetState();
}

class _PixelWidgetState extends State<PixelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Visibility(
          visible: widget.number != null,
          child: Center(child: Text(widget.number.toString()))),
    );
  }
}
