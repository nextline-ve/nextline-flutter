import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/utils/app_colors.dart';

import '../../bloc/bloc_tickets.dart';

class TicketHistoryScroll extends StatefulWidget {
  BlocTickets blocTickets;
  TicketHistoryScroll({Key key, this.blocTickets}) : super(key: key);

  @override
  _TicketHistoryScrollState createState() => _TicketHistoryScrollState();
}

class _TicketHistoryScrollState extends State<TicketHistoryScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: FutureBuilder(
            future: widget.blocTickets.getDataTickets(),
            builder: (context, snapshot) {
              print("snapshort");
              print(snapshot.data);
              return ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data
                    .map<Widget>((Ticket ticket) => _ticketRow(
                        "Ticket ${ticket.id}",
                        ticket.detalle,
                        ticket.getStatusDisplay,
                        ticket.fechaCreacion))
                    .toList(),
              );
            }),
      ),
    );
  }
}

Widget _ticketRow(String ticket, String desc, String status, String date) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
            color: AppColors.blue_dark.withOpacity(0.33),
          ),
        ]),
    child: ItemDetailHeader(
        date: date, status: status, id: ticket, label: desc, reverseLeft: true),
  );
}
