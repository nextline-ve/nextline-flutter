import 'package:flutter/material.dart';

class  WhiteLogo  extends   StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 140,
      width: 160,
      margin: EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: AssetImage("assets/images/logo_white.png"),
        ),
      ),
    );
  }
  
}