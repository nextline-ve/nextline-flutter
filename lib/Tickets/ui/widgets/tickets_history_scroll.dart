import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/utils/app_colors.dart';

class TicketHistoryScroll extends StatefulWidget {
  TicketHistoryScroll({Key key}) : super(key: key);

  @override
  _TicketHistoryScrollState createState() => _TicketHistoryScrollState();
}

class _TicketHistoryScrollState extends State<TicketHistoryScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            _ticketRow("Ticket 1231", "Internet Lento", "Atención en curso",
                "2000-12-12"),
            _ticketRow("Ticket 2526", "Internet Intermitente",
                "Pendiente por atención", "2000-12-12")
          ],
        ),
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
