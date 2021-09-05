import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/widgets/profile_image.dart';
import 'package:nextline/Profile/bloc_profile.dart';
import 'package:nextline/Profile/model/model_profile.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/utils/app_session.dart';
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
          automaticallyImplyLeading: false),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackgroundTickets(),
          Container(
            child: FutureBuilder<ProfileModel>(
                future: blocProfile.getDataProfile(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return ListView(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 45, bottom: 20),
                            child: ProfileImageSelector(
                              imageUrl: AppSession.data.avatar,
                            ),
                          ),
                        ),
                        EditableInput(
                          placeholder: "Nombre / Razón Social",
                          value: blocProfile.profileData.nombreRazsoc,
                          onSave: (val) {
                            if (val != blocProfile.profileData.nombreRazsoc) {
                              blocProfile.profileData.nombreRazsoc = val;
                              return blocProfile
                                  .patchDataProfile({"nombre_razsoc": val});
                            }
                          },
                        ),
                        EditableInput(
                          placeholder: "Cédula / RIF",
                          value: blocProfile.profileData.cedulaRif,
                          readOnly: true,
                        ),
                        EditableInput(
                          placeholder: "Número de Teléfono",
                          value: blocProfile.profileData.celular,
                          readOnly: true,
                        ),
                        EditableInput(
                          placeholder: "Correo Electrónico",
                          value: blocProfile.profileData.correo,
                          onSave: (val) {
                            if (val != blocProfile.profileData.correo) {
                              blocProfile.profileData.correo = val;
                              return blocProfile
                                  .patchDataProfile({"correo": val});
                            }
                          },
                        ),
                        EditableInput(
                          placeholder: "Dirección",
                          value: blocProfile.profileData.direccion,
                          readOnly: true,
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
      bottomNavigationBar: NavigatorBar(index: 2),
    );
  }
}
