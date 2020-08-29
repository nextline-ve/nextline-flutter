import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/widgets/profile_image.dart';
import 'package:nextline/Profile/bloc_profile.dart';
import 'package:nextline/Profile/model/model_profile.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/editable_input.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  BlocProfile blocProfile = BlocProfile();

  String nombreRazsoc = "";
  String cedulaRif = "";
  String correo = "";
  String avatar = "";
  String celular = "";
  String direccion = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        centerTitle: true,
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
            child: FutureBuilder<ProfileModel>(
                future: blocProfile.getDataProfile(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    nombreRazsoc = blocProfile.profileData.nombreRazsoc;
                    cedulaRif = blocProfile.profileData.cedulaRif;
                    celular = blocProfile.profileData.celular;
                    correo = blocProfile.profileData.correo;
                    direccion = blocProfile.profileData.direccion;
                    avatar = blocProfile.profileData.avatar;
                    return ListView(
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
                          value: cedulaRif,
                          onSave: (val) {
                            setState(() {
                              cedulaRif = val;
                            });
                            return val;
                          },
                        ),
                        EditableInput(
                          placeholder: "Número de Teléfono",
                          value: celular,
                          onSave: (val) {
                            setState(() {
                              celular = val;
                            });
                            return val;
                          },
                        ),
                        EditableInput(
                          placeholder: "Correo Electrónico",
                          value: correo,
                          onSave: (val) {
                            setState(() {
                              correo = val;
                            });
                            return val;
                          },
                        ),
                        EditableInput(
                          placeholder: "Dirección",
                          value: direccion,
                          onSave: (val) {
                            setState(() {
                              direccion = val;
                            });
                            return val;
                          },
                        ),
                      ],
                    );
                  }
                  return JLoadingScreen();
                }),
          )
        ],
      ),
      endDrawer: LateralMenu(),
      bottomNavigationBar: NavigatorBar(),
    );
  }
}
