import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/confirmation_modal.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:intl/intl.dart';

class BreakScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BreakScreen();
  }
}

class _BreakScreen extends State<BreakScreen> {
  int selectedHours;
  int selectedMinutes;
  final hourItems = [
    new DropdownItemType(id: 1, nombre: "1 hora"),
    new DropdownItemType(id: 2, nombre: "2 horas"),
    new DropdownItemType(id: 3, nombre: "3 horas"),
    new DropdownItemType(id: 4, nombre: "4 horas"),
    new DropdownItemType(id: 5, nombre: "5 horas"),
    new DropdownItemType(id: 6, nombre: "6 horas")
  ];
  final minuteItems = [
    new DropdownItemType(id: 15, nombre: "15 minutos"),
    new DropdownItemType(id: 20, nombre: "20 minutos"),
    new DropdownItemType(id: 30, nombre: "30 minutos"),
    new DropdownItemType(id: 40, nombre: "40 minutos"),
    new DropdownItemType(id: 45, nombre: "45 minutos")
  ].toList();

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
        body: Stack(children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Break",
                          style: TextStyle(
                              color: AppColors.blue_dark,
                              fontSize: 18,
                              fontFamily: AppFonts.poppins_bold),
                        )),
                    Expanded(
                        child: Column(
                      children: [
                        InputContainer(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            label: "Motivo del Break",
                            input: DropdownWidget(
                              hintText: "Seleccione una avería",
                              options: [],
                            )),
                        // JButton(
                        //     label: "Time",
                        //     onTab: () => showTimePicker(
                        //             context: context, initialTime: selectedTime)
                        //         .then((value) => setState(() {
                        //               selectedTime = value;
                        //             }))),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InputContainer(
                                  padding: EdgeInsets.only(
                                      right: 10, top: 10, bottom: 10),
                                  label: "Tiempo del Break",
                                  input: DropdownWidget(
                                    hintText: "0 horas",
                                    options: hourItems,
                                    value: selectedHours != null
                                        ? selectedHours.toString()
                                        : null,
                                    onChanged: (val) => {
                                      setState(() {
                                        selectedHours = int.parse(val);
                                      })
                                    },
                                  )),
                            ),
                            Expanded(
                              flex: 1,
                              child: InputContainer(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10),
                                  label: "",
                                  input: DropdownWidget(
                                    hintText: "0 minutos",
                                    options: minuteItems,
                                    value: selectedMinutes != null
                                        ? selectedMinutes.toString()
                                        : null,
                                    onChanged: (val) => {
                                      setState(() {
                                        selectedMinutes = int.parse(val);
                                      })
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ],
                    )),
                    JButton(
                        label: "GUARDAR",
                        padding: EdgeInsets.symmetric(vertical: 20),
                        background: AppColors.green_color,
                        onTab: () {
                          final now = DateTime.now();
                          final breakTime = new DateFormat.jm().format(DateTime(
                              now.year,
                              now.month,
                              now.day,
                              now.hour + selectedHours,
                              now.minute + selectedMinutes));
                          showConfirmationDialog(
                              context,
                              () => Navigator.pushReplacementNamed(
                                  context, '/technician-home'),
                              () => Navigator.pop(context),
                              title: Text("Solicitar un Descanso"),
                              content: Text(
                                  "Su descanso terminará a las $breakTime\n¿Está seguro de que desea soliticar un descanso?"));
                        }),
                  ])),
        ]));
  }
}
