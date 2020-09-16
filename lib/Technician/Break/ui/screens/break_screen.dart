import 'package:flutter/material.dart';
import 'package:nextline/Technician/Break/ui/widgets/form_break.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/utils/app_session.dart';
import 'package:nextline/widgets/confirmation_modal.dart';
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
      body: Stack(children: [FormBreak()]),
      bottomNavigationBar: NavigatorBar(index: 2),
    );
  }
}
