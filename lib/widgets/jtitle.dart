import 'package:flutter/material.dart';

class JTitle extends StatelessWidget {
  final String title;
  final Color color;
  final String font;

  const JTitle({Key key, @required this.title, this.color,  this.font = "fontTitle"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: font,
        color: (color == null) ? Colors.white : color,
        fontSize: 37,
      ),
    );
  }
}
