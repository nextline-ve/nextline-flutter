import 'package:flutter/material.dart';

class JTitle extends StatelessWidget {
  final String title;
  final Color color;

  const JTitle({Key key, @required this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(
        fontFamily: "fontTitle",
        color: (color == null) ? Colors.white : color,
        fontSize: 45,
      ),
    );
  }

}