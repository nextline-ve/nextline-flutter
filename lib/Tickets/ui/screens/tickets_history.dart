import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/add_ticket.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';

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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackgroundTickets(),
          Container(
            child: Column(
              children: [AddTicketButton()],
            ),
          )
        ],
      ),
    );
  }
}
