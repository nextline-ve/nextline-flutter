import 'package:flutter/material.dart';
import 'package:nextline/Tickets/bloc/bloc_tickets.dart';
import 'package:nextline/Tickets/ui/screens/form_ticket.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
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
                child: FormTicket(
                  blocTickets: widget.blocTickets,
                )),
          )
        ],
      ),
      endDrawer: LateralMenu(),
    );
  }
}
