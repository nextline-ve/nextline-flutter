import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        title: Text(
          'PERFIL',
          style: TextStyle(fontFamily: AppFonts.input),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackgroundTickets(),
          Container(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 245),
                    child: Text("¡Gracias por su pago!", style: TextStyle(color: AppColors.blue, fontSize: 19, fontFamily: AppFonts.poppins_bold),),
                  ),
                ),
                Center(
                  child: Text("A la espera de confirmación"),
                ),
                Image(
                  image: AssetImage("assets/images/success_payment.png"),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                        image: AssetImage("assets/images/success_payment.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      endDrawer: LateralMenu(),
      bottomNavigationBar: NavigatorBar(),
    );
  }
}