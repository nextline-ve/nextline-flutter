import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/editable_input.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/lateral_menu.dart';

class AssignmentDetailsScreen extends StatefulWidget {
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
                      date: "12/12/12",
                      status: "Pendiente por Atención",
                      id: "Ticket 1",
                      label: "No tengo internet >:(",
                      reverseLeft: true),
                ),
                Expanded(
                    child: Column(
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
                )),
                Container(
                  width: 250,
                  child: JButton(
                    padding: 10,
                    icon: Icons.comment,
                    fontSize: 10,
                    labelColor: AppColors.white_color,
                    label: "CONVERSAR CON CLIENTE",
                    background: AppColors.blue,
                    buttonHeight: 40.0,
                    onTab: () => {},
                  ),
                ),
                Container(
                  width: 250,
                  child: JButton(
                    padding: 10,
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
                  onTab: () => {},
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
