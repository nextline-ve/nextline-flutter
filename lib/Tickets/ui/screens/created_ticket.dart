import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class CreatedTicketScreen extends StatefulWidget {
  final bool isClient = true;
  final String userName = "oscar castillejo";

  @override
  State<StatefulWidget> createState() {
    return _CreatedTicketScreen();
  }
}

class _CreatedTicketScreen extends State<CreatedTicketScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleView("Su ticket se ha \n creado con éxito"),
                _simpleLabel(
                    "Un técnico se pondrá en contacto \n con usted en un plazo de 24 horas"),
                _card("2235", "Sin Internet")
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _titleView(String text) {
  return Text(
    StringUtils.capitalize(text),
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: AppFonts.poppins_bold,
        fontSize: 18,
        color: AppColors.blue_dark),
  );
}

Widget _simpleLabel(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: AppFonts.poppins_regular,
        fontSize: 12,
        color: AppColors.black_color),
  );
}

Widget _card(String number, String type) {
  return Container(
      padding: EdgeInsets.all(50),
      margin: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(204, 223, 238, 1),
            spreadRadius: 4,
            blurRadius: 14,
            offset: Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Ticket",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: AppFonts.poppins_light,
                fontSize: 18,
                color: AppColors.blue_dark),
          ),
          Text(
            number,
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.2,
                fontFamily: AppFonts.poppins_bold,
                fontSize: 60,
                color: AppColors.blue_dark),
          ),
          _simpleLabel("01/08/2020"),
          Text(
            type,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: AppFonts.poppins_regular,
                fontSize: 24,
                color: AppColors.black_color),
          )
        ],
      ));
}
