import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';
import 'package:nextline/widgets/background.dart';

class BillSent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BillSent();
  }
}

class _BillSent extends State<BillSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 109, 186, 1),
        centerTitle: true,
        title: Text(
          'FACTURACIÓN',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
        ),
      ),
      body: Stack(
        children: [
          Background(pathImage: "assets/images/fondo_app.png"),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "¡Gracias por su pago!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 18,
                      fontFamily: AppFonts.poppins_bold),
                ),
                Text(
                  "A la espera de confirmación",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.black_color,
                      fontSize: 12,
                      fontFamily: AppFonts.poppins_regular),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                      right: 30,
                      left: 30,
                      bottom: 60,
                    ),
                    child: Image.asset('assets/images/facturacion.png',
                        width: 300)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigatorBar(),
      endDrawer: LateralMenu(),
    );
  }

}
