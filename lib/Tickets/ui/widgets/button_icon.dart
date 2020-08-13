import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class ButtonIcon extends StatefulWidget {
  final IconData icon;
  final Function textWidget;
  final String text;
  final Color background;
  final Color iconColor;
  final double height;
  ButtonIcon({
    Key key,
    @required this.icon,
    @required this.text,
    this.height = 30,
    this.textWidget = _buttonLabel,
    this.background = AppColors.blue_dark,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  _ButtonIconState createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.widget.height,
      padding: EdgeInsets.symmetric(horizontal: 23),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.widget.height),
          color: this.widget.background,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.26),
                offset: Offset(0, this.widget.height * 10 / 80),
                spreadRadius: 3)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(this.widget.icon, color: this.widget.background),
          this.widget.textWidget(this.widget.text, this.widget.iconColor),
          Icon(
            this.widget.icon,
            color: this.widget.iconColor,
          )
        ],
      ),
    );
  }
}

Widget _buttonLabel(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: AppFonts.poppins_regular, fontSize: 18, color: color),
  );
}
