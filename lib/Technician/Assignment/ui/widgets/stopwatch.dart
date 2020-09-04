import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class StopwatchWidget extends StatefulWidget {
  final Stopwatch stopwatch;

  StopwatchWidget({Key key, @required this.stopwatch}) : super(key: key);
  _StopwatchWidgetState createState() =>
      _StopwatchWidgetState(stopwatch: stopwatch);
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  Timer timer;
  final Stopwatch stopwatch;

  _StopwatchWidgetState({this.stopwatch}) {
    timer = new Timer.periodic(new Duration(milliseconds: 30), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Horas",
                    style: TextStyle(
                        fontSize: 9,
                        fontFamily: AppFonts.poppins_regular,
                        color: AppColors.gray_text_color)),
                Text(StopwatchFormatter.getHours(stopwatch.elapsedMilliseconds),
                    style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: AppFonts.poppins_regular,
                        color: AppColors.blue_dark)),
              ],
            ),
          ),
          Text(":",
              style: TextStyle(
                  fontSize: 60.0,
                  fontFamily: AppFonts.poppins_regular,
                  color: AppColors.blue_dark)),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Minutos",
                    style: TextStyle(
                        fontSize: 9,
                        fontFamily: AppFonts.poppins_regular,
                        color: AppColors.gray_text_color)),
                Text(
                    StopwatchFormatter.getMinutes(
                        stopwatch.elapsedMilliseconds),
                    style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: AppFonts.poppins_regular,
                        color: AppColors.blue_dark)),
              ],
            ),
          ),
          Text(":",
              style: TextStyle(
                  fontSize: 60.0,
                  fontFamily: AppFonts.poppins_regular,
                  color: AppColors.blue_dark)),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Segundos",
                    style: TextStyle(
                        fontSize: 9,
                        fontFamily: AppFonts.poppins_regular,
                        color: AppColors.gray_text_color)),
                Text(
                    StopwatchFormatter.getSeconds(
                        stopwatch.elapsedMilliseconds),
                    style: TextStyle(
                        fontSize: 60.0,
                        fontFeatures: [FontFeature.tabularFigures()],
                        fontFamily: AppFonts.poppins_regular,
                        color: AppColors.blue_dark)),
              ],
            ),
          )
        ])
      ],
    );
  }
}

class StopwatchFormatter {
  static String getHours(int milliseconds) {
    int hours = ((milliseconds / 3600000).truncate());
    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    return "$hoursStr";
  }

  static String getMinutes(int milliseconds) {
    int minutes = (milliseconds / 60000).truncate();
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    return "$minutesStr";
  }

  static String getSeconds(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return "$secondsStr";
  }
}
