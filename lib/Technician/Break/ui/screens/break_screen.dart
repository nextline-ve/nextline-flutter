import 'package:flutter/material.dart';
import 'package:nextline/Technician/Break/ui/widgets/form_break.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

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
        body: Stack(children: [FormBreak()]));
  }
}
