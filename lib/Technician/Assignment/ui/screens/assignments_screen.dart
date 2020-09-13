import 'package:flutter/material.dart';
import 'package:nextline/Technician/Assignment/ui/screens/assignment_details_screen.dart';
import 'package:nextline/Technician/Break/ui/screens/break_screen.dart';
import 'package:nextline/Tickets/bloc/bloc_tickets.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/Tickets/ui/widgets/ticket_row.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class AssignmentsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssignmentsScreen();
  }
}

class _AssignmentsScreen extends State<AssignmentsScreen> {
  BlocTickets blocTickets = BlocTickets();

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
            child: FutureBuilder(
                future: blocTickets.getAssignedTickets(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData)
                      return ListView(
                        scrollDirection: Axis.vertical,
                        children: snapshot.data
                            .map<Widget>((Ticket ticket) => TicketRow(
                                ticket: ticket,
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AssignmentDetailsScreen(
                                              ticket: ticket,
                                              blocTickets: blocTickets,
                                            )))))
                            .toList(),
                      );
                    return Center(
                      child: Text(
                        "Usted no tiene\ntickets asignados",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.blue_dark,
                            fontSize: 19,
                            fontFamily: AppFonts.poppins_bold),
                      ),
                    );
                  }
                  return JLoadingScreen();
                }),
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
