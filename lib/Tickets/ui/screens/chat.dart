import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class Chat extends StatefulWidget {
  final bool isClient = true;
  final String userName = "oscar castillejo";

  @override
  State<StatefulWidget> createState() {
    return _Chat();
  }
}

class _Chat extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _message("", "", "", true),
                _message("", "", "", false)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _nameLabel(String text) {
  return Text(
    StringUtils.capitalize(text),
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: AppFonts.poppins_bold,
        fontSize: 10,
        color: AppColors.blue_dark),
  );
}

Widget _dateLabel(String text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: AppFonts.poppins_regular,
        fontSize: 10,
        color: AppColors.light_gray_color.withOpacity(1)),
    softWrap: true,
  );
}

Widget _messageContent(String text) {
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
        fontFamily: AppFonts.poppins_regular,
        fontSize: 12,
        color: AppColors.black_color),
    softWrap: true,
  );
}

Widget _message(String text, String username, String date, bool isLeft) {
  List<Widget> children = [
    Container(
      transform: Matrix4.translationValues(0, 10, 0),
      child: Icon(
        Icons.account_circle,
        size: 50,
      ),
    ),
    Container(
      transform: Matrix4.translationValues(isLeft ? -15 : 15, 10, 0),
      child: Icon(isLeft ? Icons.arrow_left : Icons.arrow_right,
          size: 50,
          color: isLeft
              ? AppColors.light_gray_color.withOpacity(0.10)
              : AppColors.ligth_blue_color.withOpacity(0.1)),
    ),
    Expanded(
        child: Container(
      transform: Matrix4.translationValues(isLeft ? -35.5 : 35.5, 0, 0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: isLeft
              ? AppColors.light_gray_color.withOpacity(0.10)
              : AppColors.ligth_blue_color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _nameLabel("Alberto Zambrano"),
            _dateLabel("01/08/2020"),
          ]),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: _messageContent(
                  "Lorem ipsum dolor sit amet,s consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et."))
        ],
      ),
    ))
  ];
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: isLeft ? children : children.reversed.toList()),
  );
}
