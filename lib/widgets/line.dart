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