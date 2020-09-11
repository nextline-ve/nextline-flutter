import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:signature/signature.dart';

class ClientConfirmationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientConfirmationScreen();
  }
}

class _ClientConfirmationScreen extends State<ClientConfirmationScreen> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: AppColors.black_color,
    exportBackgroundColor: Colors.white,
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print("Value changed"));
  }

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
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Confirmación del Cliente",
                      style: TextStyle(
                          color: AppColors.blue_dark,
                          fontSize: 18,
                          fontFamily: AppFonts.poppins_bold),
                    )),
                Text(
                  "Firma",
                  style: TextStyle(
                      color: AppColors.black_color,
                      fontSize: 12,
                      fontFamily: AppFonts.poppins_regular),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(25),
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gray_shadow_color,
                            blurRadius: 20,
                            spreadRadius: 10,
                          )
                        ]),
                    child: Signature(
                        controller: _controller,
                        height: 360,
                        width: 300,
                        backgroundColor: Colors.white),
                  ),
                ),
                Container(
                  width: 250,
                  child: JButton(
                    padding: EdgeInsets.all(10),
                    fontSize: 10,
                    labelColor: AppColors.white_color,
                    label: "INICIAR DE NUEVO",
                    background: AppColors.blue,
                    buttonHeight: 40.0,
                    onTab: () => setState(() => _controller.clear()),
                  ),
                ),
                JButton(
                  label: "FINALIZAR",
                  background: AppColors.green_color,
                  onTab: () => Navigator.pushReplacementNamed(
                      context, '/technician-home'),
                ),
              ]),
            )
          ],
        ));
  }
}
