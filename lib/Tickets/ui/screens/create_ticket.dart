import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/add_ticket.dart';
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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleView("Nuevo Ticket"),
                _date("01/08/2020"),
                _inputLabel("Tipo de Avería"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: DropdownWidget(),
                ),
                _inputLabel("Comentario"),
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
  return Text(
    text,
    style: TextStyle(
        fontFamily: AppFonts.poppins_bold,
        fontSize: 12,
        color: AppColors.gray_text_color),
  );
}

Widget _inputLabel(String text) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
        fontFamily: AppFonts.poppins_bold,
        fontSize: 11,
        color: AppColors.blue_dark),
  );
}
