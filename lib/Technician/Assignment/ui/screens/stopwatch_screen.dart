import 'package:flutter/material.dart';
import 'package:nextline/Technician/Assignment/ui/widgets/stopwatch.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';

class StopwatchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StopwatchScreen();
  }
}

class _StopwatchScreen extends State<StopwatchScreen> {
  Stopwatch stopwatch = new Stopwatch();

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
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Reparación de Avería",
                        style: TextStyle(
                            color: AppColors.blue_dark,
                            fontSize: 18,
                            fontFamily: AppFonts.poppins_bold),
                      )),
                  Text(
                    "Duración del Trabajo",
                    style: TextStyle(
                        color: AppColors.black_color,
                        fontSize: 12,
                        fontFamily: AppFonts.poppins_regular),
                  ),
                  Expanded(
                    child: StopwatchWidget(
                      stopwatch: stopwatch,
                    ),
                  ),
                  stopwatch.isRunning
                      ? JButton(
                          label: "FINALIZAR",
                          background: AppColors.green_color,
                          onTab: () => {
                            setState(() {
                              stopwatch.stop();
                            })
                          },
                        )
                      : JButton(
                          label: "EMPEZAR",
                          background: AppColors.ligth_blue_color,
                          onTab: () => {
                            setState(() {
                              stopwatch.start();
                            })
                          },
                        ),
                ],
              ))
        ]));
  }
}
