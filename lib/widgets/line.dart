import 'package:flutter/material.dart';

class Line extends StatelessWidget{
  final double top;
  final double width;

  const Line({Key key, @required this.top, this.width,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 1,
      width: (width == null) ? 260 : width,
      margin: EdgeInsets.only(top: top),
      decoration: BoxDecoration(
        color: Colors.white70,
      ),
    );
  }
}

class VerticalLine extends StatelessWidget {
  final double heigth;
  final double width;
  final Color color;

  const VerticalLine(
      {Key key,
      @required this.heigth,
      this.width = 1,
      this.color = Colors.white70})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: this.heigth,
      width: this.width,
      // margin: EdgeInsets.only(top: top),
      decoration: BoxDecoration(
        color: this.color,
      ),
    );
  }
}