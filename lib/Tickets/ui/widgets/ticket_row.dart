import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/utils/app_colors.dart';

class TicketRow extends StatefulWidget {
  final void Function() onTap;
  final Ticket ticket;

  TicketRow({Key key, @required this.onTap, @required this.ticket})
      : super(key: key);

  @override
  _TicketRowState createState() => _TicketRowState();
}

class _TicketRowState extends State<TicketRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              date: widget.ticket.fechaCreacion,
              status:
                  widget.ticket.mapToTicketStatusString(widget.ticket.status),
              id: "Ticket ${widget.ticket.id}",
              label: widget.ticket.detalle,
              reverseLeft: true),
        ));
  }
}
