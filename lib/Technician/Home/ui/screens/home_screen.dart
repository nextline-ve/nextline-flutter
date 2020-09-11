import 'package:flutter/material.dart';
import 'package:nextline/Technician/Assignment/ui/screens/assignment_details_screen.dart';
import 'package:nextline/Technician/Break/ui/screens/break_screen.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/Tickets/ui/widgets/ticket_row.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class TechHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TechHomeScreen();
  }
}

class _TechHomeScreen extends State<TechHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.blue_dark,
          centerTitle: true,
          title: Text(
            'ASIGNACIONES TÉCNICAS',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
          ),
          automaticallyImplyLeading: false),
      body: Stack(
        children: [
          Expanded(
            child: ListView(children: [
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
              TicketRow(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentDetailsScreen())),
                  ticket: Ticket(
                      id: 1,
                      tipo: TicketType.C,
                      fechaCreacion: "52/52/52",
                      status: TicketStatus.A,
                      getStatusDisplay: "test",
                      asunto: 1,
                      detalle: "detalle",
                      cliente: 1)),
            ]),
          )
        ],
      ),
      bottomNavigationBar: NavigatorBar(
        items: [
          NavigatorItem(
              1,
              Icons.home,
              () =>
                  Navigator.pushReplacementNamed(context, '/technician-home')),
          NavigatorItem(
            2,
            Icons.av_timer,
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => BreakScreen())),
          ),
          NavigatorItem(3, Icons.person,
              () => Navigator.pushReplacementNamed(context, '/profile'))
        ],
      ),
    );
  }
}
