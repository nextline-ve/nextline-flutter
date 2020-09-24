import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WhiteLogo extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  WhiteLogo({Key key, this.margin = const EdgeInsets.symmetric(vertical: 40)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 160,
      margin: this.margin,
      child: SvgPicture.asset(
        "assets/images/logo_white.svg",
        color: Colors.white,
      ),
    );
  }
}
