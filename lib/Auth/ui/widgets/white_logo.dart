import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class  WhiteLogo  extends   StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 140,
      width: 160,
      margin: EdgeInsets.only(bottom: 20),
      child: SvgPicture.asset("assets/images/logo_white.svg", color: Colors.white,),
    );
  }
  
}