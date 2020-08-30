import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
import 'package:nextline/Tickets/ui/widgets/add_ticket.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';
import 'package:nextline/Tickets/ui/widgets/tickets_history_scroll.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

import '../../bloc/bloc_tickets.dart';

class HistoryTicketScreen extends StatefulWidget {
  final bool isClient = true;
  final String userName = "oscar castillejo";

  @override
  State<StatefulWidget> createState() {
    return _HistoryTicketScreen();
  }
}

class _HistoryTicketScreen extends State<HistoryTicketScreen> {
  BlocTickets blocTickets = BlocTickets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        centerTitle: true,
        title: Text(
          'ASISTENCIA TÉCNICA',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackgroundTickets(),
          Container(
            child: Column(
              children: [
                AddTicketButton(
                  blocTickets: blocTickets,
                ),
                _titleText("Histórico de tickets"),
                TicketHistoryScroll(blocTickets: blocTickets)
              ],
            ),
          )
        ],
      ),
      endDrawer: LateralMenu(),
      bottomNavigationBar: NavigatorBar(),
    );
  }
}

Widget _titleText(String status) {
  return Container(
    margin: EdgeInsets.only(top: 52, bottom: 15),
    child: Text(status.toUpperCase(),
        style: TextStyle(
            fontFamily: AppFonts.poppins_regular,
            fontSize: 18,
            color: AppColors.blue_dark)),
  );
}
