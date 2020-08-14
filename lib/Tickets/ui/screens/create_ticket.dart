import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/button_icon.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class CreateTicketScreen extends StatefulWidget {
  final bool isClient = true;
  final String userName = "oscar castillejo";

  @override
  State<StatefulWidget> createState() {
    return _CreateTicketScreen();
  }
}

class _CreateTicketScreen extends State<CreateTicketScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            padding: EdgeInsets.only(
              top: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleView("Nuevo Ticket"),
                _date("01/08/2020"),
                _inputContainer(_inputLabel("Tipo de Avería"),
                    DropdownWidget(hintText: "Seleccione una avería")),
                _inputContainer(
                  _inputLabel("Comentario2"),
                  _textArea(
                      "Explique en breves palabras el problema de su avería, y un técnico se pondrá en contacto con usted en un plazo de 24 horas."),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 24, right: 24, bottom: 14),
                        child: ButtonIcon(
                          icon: Icons.send,
                          text: "VER TICKET",
                          background: AppColors.green_color,
                          height: 60,
                          onTab: () => Navigator.popAndPushNamed(
                              context, '/success-create-ticket'),
                        ),
                      ),
                    ],
                  ),
                )
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
    StringUtils.capitalize(text, allWords: true),
    style: TextStyle(
        fontFamily: AppFonts.poppins_bold,
        fontSize: 18,
        color: AppColors.blue_dark),
  );
}

Widget _date(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Text(
      text,
      style: TextStyle(
          fontFamily: AppFonts.poppins_regular,
          fontSize: 12,
          color: AppColors.black_color),
    ),
  );
}

Widget _inputLabel(String text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
        fontFamily: AppFonts.subTitle,
        fontSize: 11,
        color: AppColors.blue_dark),
  );
}

Widget _textArea(String hinText) {
  return Column(
    children: <Widget>[
      Container(
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration.collapsed(
                    hintText: hinText,
                    hintStyle: TextStyle(
                        color: AppColors.black_color.withOpacity(0.34),
                        fontSize: 12,
                        fontFamily: AppFonts.poppins_regular)),
              ),
            )),
      )
    ],
  );
}

Widget _inputContainer(Widget label, Widget input) {
  return Container(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: label,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: AppColors.blue_dark.withOpacity(0.15),
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: input)
        ],
      ));
}
