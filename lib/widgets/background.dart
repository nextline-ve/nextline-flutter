import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String path_image;

  const Background({Key key, @required this.path_image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: null,
      decoration: BoxDecoration(
        color: Colors.black87,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(path_image),
        ),
      ),
    );
  }

}