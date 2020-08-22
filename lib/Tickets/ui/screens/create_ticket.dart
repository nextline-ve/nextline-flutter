import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Tickets/bloc/bloc_tickets.dart';
import 'package:nextline/Tickets/model/model_issue_type.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/lateral_menu.dart';

class CreateTicketScreen extends StatefulWidget {
  final BlocTickets blocTickets;

  const CreateTicketScreen({Key key, @required this.blocTickets})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateTicketScreen();
  }
}

class _CreateTicketScreen extends State<CreateTicketScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
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
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 12,
              ),
              child: FutureBuilder<List<IssueType>>(
                  future: widget.blocTickets.getDataIssueType(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done)
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              _titleView("Nuevo Ticket"),
                              _date(
                                  "${today.day}/${today.month}/${today.year}"),
                              InputContainer(
                                  label: "Tipo de Avería",
                                  input: DropdownWidget(
                                      hintText: "Seleccione una avería",
                                      options: snapshot.data)),
                              InputContainer(
                                label: "Comentario",
                                input: _textArea(
                                    "Explique en breves palabras el problema de su avería, y un técnico se pondrá en contacto con usted en un plazo de 24 horas."),
                              ),
                            ],
                          ),
                          JButton(
                            icon: Icons.send,
                            label: "VER TICKET",
                            background: AppColors.green_color,
                            onTab: () => Navigator.popAndPushNamed(
                                context, '/success-create-ticket'),
                          ),
                        ],
                      );
                    return JLoadingScreen();
                  }),
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
