import 'package:flutter/material.dart';
import 'package:nextline/Technician/Break/bloc_break.dart';
import 'package:nextline/Technician/Break/model_break.dart';
import 'package:nextline/Technician/Break/model_reason.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/utils/app_http.dart';
import 'package:nextline/utils/app_session.dart';
import 'package:nextline/widgets/confirmation_modal.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:intl/intl.dart';
import 'package:nextline/widgets/jloading_screen.dart';

class FormBreak extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormBreak();
  }
}

class _FormBreak extends State<FormBreak> {
  BlocBreaks blocBreaks = new BlocBreaks();
  int selectedReason;
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
  List<Reason> reasons = [];

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              child: FutureBuilder<List<Reason>>(
                  future: blocBreaks.getReasons(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done ||
                        this.reasons.length > 0) {
                      if (this.reasons.length == 0)
                        this.reasons = snapshot.data;
                      return Column(
                        children: [
                          InputContainer(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              label: "Motivo del Break",
                              input: DropdownWidget(
                                hintText: "Seleccione una avería",
                                options:
                                    DropdownItemType.generateList(this.reasons),
                                value: selectedReason != null
                                    ? selectedReason.toString()
                                    : null,
                                onChanged: (val) => {
                                  setState(() {
                                    selectedReason = int.parse(val);
                                  })
                                },
                              )),
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
                      );
                    }
                    return JLoadingScreen();
                  })),
          JButton(
              label: "GUARDAR",
              padding: EdgeInsets.symmetric(vertical: 20),
              background: this.canSave()
                  ? AppColors.green_color
                  : AppColors.light_gray_color,
              onTab: () {
                if (this.canSave()) {
                  if (this.selectedHours == null) this.selectedHours = 0;
                  if (this.selectedMinutes == null) this.selectedMinutes = 0;
                  final now = DateTime.now();
                  final breakTime = new DateFormat.jm().format(DateTime(
                      now.year,
                      now.month,
                      now.day,
                      now.hour + selectedHours,
                      now.minute + selectedMinutes));
                  showConfirmationDialog(context, () {
                    AppHttp.requestIndicator(context);
                    blocBreaks
                        .addBreak(Break.fromPartial(
                            hora: selectedHours.toString(),
                            minutos: selectedMinutes.toString(),
                            fecha: "${now.year}-${now.month}-${now.day}",
                            motivo: selectedReason,
                            tecnico: AppSession.data.idUsuario.toString()))
                        .then((value) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Su break ha sido solicitado con éxito")));
                      setState(() {
                        selectedReason = null;
                        selectedHours = null;
                        selectedMinutes = null;
                      });
                    });
                  }, () => {},
                      title: Text("Solicitar un Descanso"),
                      content: Text(
                          "Su descanso terminará a las $breakTime\n¿Está seguro de que desea soliticar un descanso?"));
                }
              }),
        ]));
  }

  bool canSave() {
    return this.selectedReason != null &&
        (this.selectedHours != null || this.selectedMinutes != null);
  }
}

// JButton(
//     label: "Time",
//     onTab: () => showTimePicker(
//             context: context, initialTime: selectedTime)
//         .then((value) => setState(() {
//               selectedTime = value;
//             }))),
