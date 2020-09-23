import 'package:flutter/material.dart';
import 'package:nextline/Technician/Break/ui/widgets/form_break.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

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
        automaticallyImplyLeading: false,
        actions: [LateralMenu.exitFromAppButton(context)],
      ),
      body: Stack(children: [FormBreak()]),
      bottomNavigationBar: NavigatorBar(index: 2),
    );
  }
}
