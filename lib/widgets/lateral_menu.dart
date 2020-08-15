import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class LateralMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          _logo(),
          _item(context, "CAMBIO DE PLAN", "assets/images/cambioplan.svg",
              "change-plan"),
          _item(
              context, "FACTURACIÓN", "assets/images/facturacion.svg", "bills"),
          _item(context, "ASISTENCIA TÉCNICA",
              "assets/images/asistenciatecnica.svg", "tickets"),
          _closed(),
        ],
      ),
    );
  }

  Widget _item(context, String title, String pathIcon, String url) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, "/$url");
      },
      child: Center(
        child: Container(
          width: 230,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(204, 223, 238, 1),
                spreadRadius: 4,
                blurRadius: 14,
                offset: Offset(0, 8), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SvgPicture.asset(
                  pathIcon,
                  color: AppColors.blue_dark,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 14, bottom: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      color: AppColors.blue_dark,
                      fontFamily: AppFonts.poppins_regular,
                      fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _closed() {
    return Center(
      child: Container(
        width: 230,
        margin: EdgeInsets.only(top: 80),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(204, 223, 238, 1),
              spreadRadius: 4,
              blurRadius: 14,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Text("CERRAR SESIÓN",
                      style: TextStyle(
                          color: AppColors.blue_dark,
                          fontFamily: AppFonts.poppins_regular,
                          fontSize: 17)),
                ),
                Expanded(
                  flex: 2,
                  child: SvgPicture.asset(
                    "assets/images/cerrarsesion.svg",
                    color: AppColors.blue_dark,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 40, bottom: 30),
        width: 220,
        height: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/logomenu.jpg"),
          ),
        ),
      ),
    );
  }
}
