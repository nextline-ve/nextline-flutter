import 'package:flutter/material.dart';
import 'package:nextline/Technician/Assignment/ui/screens/assignment_details_screen.dart';
import 'package:nextline/Technician/Break/ui/screens/break_screen.dart';
import 'package:nextline/Tickets/bloc/bloc_tickets.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
import 'package:nextline/Tickets/ui/widgets/ticket_row.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/utils/app_session.dart';
import 'package:nextline/widgets/confirmation_modal.dart';
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
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
              onTap: () {
                showConfirmationDialog(
                    context,
                    () => AppSession().unregister().then(
                        (value) => Navigator.pushNamed(context, '/login')),
                    () => Navigator.pop(context),
                    title: Text("Cerrar Sesión"),
                    content: Text("¿Está seguro de que desea salir?"));
              },
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.blue_dark,
                    borderRadius: BorderRadius.circular(10),
                  ))),
        ],
      ),
      body: Stack(
        children: [
          Expanded(
            child: FutureBuilder(
                future: blocTickets.getAssignedTickets(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data.length > 0)
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
                        "Usted no tiene tickets asignados",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.blue_dark,
                            fontSize: 16,
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
