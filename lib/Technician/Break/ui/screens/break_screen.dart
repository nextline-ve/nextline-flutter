import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';

class BreakScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BreakScreen();
  }
}

class _BreakScreen extends State<BreakScreen> {
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
                        InputContainer(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            label: "Tiempo del Break",
                            input: DropdownWidget(
                              hintText: "Seleccione una avería",
                              options: [],
                            )),
                      ],
                    )),
                    JButton(
                      label: "GUARDAR",
                      padding: EdgeInsets.symmetric(vertical: 20),
                      background: AppColors.green_color,
                      onTab: () => Navigator.pushReplacementNamed(
                          context, '/technician-home'),
                    ),
                  ])),
        ]));
  }
}
