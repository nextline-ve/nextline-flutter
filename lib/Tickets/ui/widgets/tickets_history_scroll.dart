import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/Tickets/ui/screens/chat.dart';
import 'package:nextline/Tickets/ui/widgets/ticket_row.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/widgets/jloading_screen.dart';

import '../../bloc/bloc_tickets.dart';

class TicketHistoryScroll extends StatefulWidget {
  final BlocTickets blocTickets;
  TicketHistoryScroll({Key key, this.blocTickets}) : super(key: key);

  @override
  _TicketHistoryScrollState createState() => _TicketHistoryScrollState();
}

class _TicketHistoryScrollState extends State<TicketHistoryScroll> {
  List<Ticket> tickets = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: FutureBuilder(
            future: widget.blocTickets.getDataTickets(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (this.tickets.length == 0) {
                  this.tickets = snapshot.data;
                  this.tickets.sort((a, b) {
                    return DateTime.parse(b.fechaCreacion)
                        .compareTo(DateTime.parse(a.fechaCreacion));
                  });
                }
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: this
                      .tickets
                      .map<Widget>((Ticket ticket) => TicketRow(
                          ticket: ticket,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chat(
                                        blocTickets: widget.blocTickets,
                                        ticket: ticket,
                                        disable: !(ticket.status == "P" ||
                                            ticket.status == "C"),
                                      )))))
                      .toList(),
                );
              }
              return JLoadingScreen();
            }),
      ),
    );
  }
}
