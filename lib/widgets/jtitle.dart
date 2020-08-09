import 'package:flutter/material.dart';

class JTitle extends StatelessWidget {
  final String title;

  const JTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(
        fontFamily: "fontTitle",
        color: Colors.white,
        fontSize: 45,
      ),
    );
  }

}