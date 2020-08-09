import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: null,
      decoration: BoxDecoration(
        color: Colors.black87,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg.jpg"),
        ),
      ),
    );
  }

}