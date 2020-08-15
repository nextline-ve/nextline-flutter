import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String pathImage;

  const Background({Key key, @required this.pathImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: null,
      decoration: BoxDecoration(
        color: Colors.black87,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage),
        ),
      ),
    );
  }
}
