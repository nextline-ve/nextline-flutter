import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/widgets/profile_image.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/editable_input.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String nombreRazsoc = "Test User";
  String cedula = "Test User";
  String telf = "Test User";
  String email = "Test User";
  String password = "Test User";

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
            child: ListView(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 45),
                    child: ProfileImageSelector(),
                  ),
                ),
                EditableInput(
                  placeholder: "Nombre / Razón Social",
                  value: nombreRazsoc,
                  onSave: (val) {
                    setState(() {
                      nombreRazsoc = val;
                    });
                    return val;
                  },
                ),
                EditableInput(
                  placeholder: "Cédula / RIF",
                  value: cedula,
                  onSave: (val) {
                    setState(() {
                      cedula = val;
                    });
                    return val;
                  },
                ),
                EditableInput(
                  placeholder: "Número de Teléfono",
                  value: telf,
                  onSave: (val) {
                    setState(() {
                      telf = val;
                    });
                    return val;
                  },
                ),
                EditableInput(
                  placeholder: "Correo Electrónico",
                  value: email,
                  onSave: (val) {
                    setState(() {
                      email = val;
                    });
                    return val;
                  },
                ),
                EditableInput(
                  placeholder: "Contraseña",
                  value: password,
                  onSave: (val) {
                    setState(() {
                      password = val;
                    });
                    return val;
                  },
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

  void _toggleShowPassword() {
    print("_toggleShowPassword ");
  }
}
