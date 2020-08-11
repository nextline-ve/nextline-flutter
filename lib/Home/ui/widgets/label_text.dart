import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_fonts.dart';

class HLabelText extends StatelessWidget {
  final String title;
  final Color color;

  const HLabelText({Key key, @required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontFamily: AppFonts.fontTitle,
        fontSize: 14,
      ),
    );
  }
}
