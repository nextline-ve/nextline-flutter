import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/Technician/Assignment/ui/screens/repair_screen.dart';
import 'package:nextline/Tickets/bloc/bloc_tickets.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';
// import 'package:nextline/Tickets/ui/screens/chat.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/editable_input.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/lateral_menu.dart';

class AssignmentDetailsScreen extends StatefulWidget {
  final Ticket ticket;
  final BlocTickets blocTickets;
  AssignmentDetailsScreen(
      {Key key, @required this.ticket, @required this.blocTickets})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AssignmentDetailsScreen();
  }
}

class _AssignmentDetailsScreen extends State<AssignmentDetailsScreen> {
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
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: ItemDetailHeader(
                      date: widget.ticket.fechaCreacion,
                      status: widget.ticket.getStatusDisplay,
                      id: "Ticket ${widget.ticket.id}",
                      label: widget.ticket.detalle,
                      reverseLeft: true),
                ),
                Expanded(
                    child: FutureBuilder<Object>(
                        future: null,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done)
                            return Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "Datos del Cliente",
                                      style: TextStyle(
                                          color: AppColors.blue_dark,
                                          fontSize: 18,
                                          fontFamily: AppFonts.poppins_bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: EditableInput(
                                      placeholder: "Nombre / Razón Social",
                                      value: "Alberto Mendoza",
                                      readOnly: true,
                                    )),
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: EditableInput(
                                      placeholder: "Número de Teléfono",
                                      value: "123123123",
                                      readOnly: true,
                                    )),
                                Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: EditableInput(
                                      placeholder: "Correo Electrónico",
                                      value: "Alberto@Mendoza.com",
                                      readOnly: true,
                                    )),
                              ],
                            );
                          return JLoadingScreen();
                        })),
                Container(
                  width: 250,
                  child: JButton(
                    padding: EdgeInsets.all(10),
                    icon: Icons.comment,
                    fontSize: 10,
                    labelColor: AppColors.white_color,
                    label: "CONVERSAR CON CLIENTE",
                    background: AppColors.blue,
                    buttonHeight: 40.0,
                    onTab: () => {},
                    // onTab: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Chat(
                    //               blocTickets: widget.blocTickets,
                    //               ticket: ticket,
                    //             ))),
                  ),
                ),
                Container(
                  width: 250,
                  child: JButton(
                    padding: EdgeInsets.all(10),
                    icon: Icons.location_on,
                    fontSize: 10,
                    labelColor: AppColors.white_color,
                    label: "VISITAR A CLIENTE",
                    background: AppColors.blue,
                    buttonHeight: 40.0,
                    onTab: () => {},
                  ),
                ),
                JButton(
                  label: "INICIAR TRABAJO",
                  background: AppColors.green_color,
                  onTab: () {
                    widget.blocTickets.beginAssignment(widget.ticket).then(
                        (value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RepairScreen())));
                  },
                ),
              ],
            ),
          )
        ],
      ),
      endDrawer: LateralMenu(),
    );
  }
}
