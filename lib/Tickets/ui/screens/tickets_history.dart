import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/add_ticket.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';
import 'package:nextline/Tickets/ui/widgets/tickets_history_scroll.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class HistoryTicketScreen extends StatefulWidget {
  final bool isClient = true;
  final String userName = "oscar castillejo";

  @override
  State<StatefulWidget> createState() {
    return _HistoryTicketScreen();
  }
}

class _HistoryTicketScreen extends State<HistoryTicketScreen> {
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
          BackgroundTickets(),
          Container(
            child: Column(
              children: [
                AddTicketButton(),
                _titleText("Histórico de tickets"),
                TicketHistoryScroll()
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
