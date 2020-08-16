import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/lateral_menu.dart';

class SuccessCreateTicketScreen extends StatefulWidget {
  final bool isClient = true;
  final String userName = "oscar castillejo";

  @override
  State<StatefulWidget> createState() {
    return _SuccessCreateTicketScreen();
  }
}

class _SuccessCreateTicketScreen extends State<SuccessCreateTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        title: Text(
          'Asistencia técnica',
          style: TextStyle(fontFamily: AppFonts.input),
        ),
      ),
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
                _card("2235", "Sin Internet", context),
              ],
            ),
          )
        ],
      ),
      endDrawer: LateralMenu(),
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

Widget _card(String number, String type, context) {
  return Container(
      padding: EdgeInsets.only(top: 31, bottom: 15, left: 26, right: 26),
      margin: EdgeInsets.symmetric(horizontal: 30),
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
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: JButton(
                  label: "Ver Ticket",
                  icon: Icons.remove_red_eye,
                  buttonHeight: 40,
                  background: AppColors.ligth_blue_color,
                  onTab: () => Navigator.popAndPushNamed(context, '/chat')),
            )
          ],
        ),
      ));
}
