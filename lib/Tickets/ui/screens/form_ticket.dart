import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Tickets/bloc/bloc_tickets.dart';
import 'package:nextline/Tickets/model/model_issue_type.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/Tickets/ui/screens/success_create_ticket.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/utils/app_http.dart';
import 'package:nextline/utils/app_utils.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jloading_screen.dart';

class FormTicket extends StatefulWidget {
  final BlocTickets blocTickets;

  const FormTicket({Key key, @required this.blocTickets}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormTicket();
  }
}

class _FormTicket extends State<FormTicket> {
  final _formKey = GlobalKey<FormState>();
  int _asunto;
  String _detalle;
  bool _createTicket = false;
  List<IssueType> types = [];

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return FutureBuilder<List<IssueType>>(
        future: widget.blocTickets.getDataIssueType(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done ||
              this.types.length > 0) {
            if (this.types.length == 0) this.types = snapshot.data;
            return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        _titleView("Nuevo Ticket"),
                        _date(AppUtils.formatDate(today.toString())),
                        InputContainer(
                            label: "Tipo de Avería",
                            input: DropdownWidget(
                              hintText: "Seleccione una avería",
                              options: this.types,
                              value:
                                  _asunto != null ? _asunto.toString() : null,
                              onChanged: (val) => {
                                setState(() {
                                  _asunto = int.parse(val);
                                })
                              },
                            )),
                        InputContainer(
                          label: "Comentario",
                          input: _textArea(
                              "Explique en breves palabras el problema de su avería, y un técnico se pondrá en contacto con usted en un plazo de 24 horas.",
                              (val) => _detalle = val),
                        ),
                      ],
                    ),
                    JButton(
                      icon: Icons.send,
                      label: "CREAR TICKET",
                      background: AppColors.green_color,
                      onTab: _setCreateTicket,
                    ),
                  ],
                ));
          }
          return JLoadingScreen();
        });
  }

  void _setCreateTicket() {
    if (_createTicket) {
      return;
    }
    final form = _formKey.currentState;
    form.save();
    if (!form.validate() || _asunto == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Verifique que haya cargado los datos correctamente')));
      return;
    }
    AppHttp.requestIndicator(context);
    widget.blocTickets
        .createTicket(Ticket.fromPartial(detalle: _detalle, asunto: _asunto))
        .then((value) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SuccessCreateTicketScreen(
                      ticket: value,
                      blocTickets: widget.blocTickets,
                    ))));
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

Widget _textArea(String hinText, onChanged) {
  return Column(
    children: <Widget>[
      Container(
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 8,
                decoration: InputDecoration.collapsed(
                    hintText: hinText,
                    hintStyle: TextStyle(
                        color: AppColors.black_color.withOpacity(0.34),
                        fontSize: 12,
                        fontFamily: AppFonts.poppins_regular)),
                onChanged: onChanged,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor escriba su comentario';
                  }
                  return null;
                },
              ),
            )),
      )
    ],
  );
}
