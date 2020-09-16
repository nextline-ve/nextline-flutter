import 'package:flutter/material.dart';
import 'package:nextline/Profile/bloc_profile.dart';
import 'package:nextline/Technician/Profile/model_profile.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/editable_input.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class TechProfileScreen extends StatefulWidget {
  @override
  _TechProfileScreenState createState() => _TechProfileScreenState();
}

class _TechProfileScreenState extends State<TechProfileScreen> {
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
        automaticallyImplyLeading: false,
        actions: [LateralMenu.exitFromAppButton(context)],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackgroundTickets(),
          Container(
            child: FutureBuilder<TechProfile>(
                future: blocProfile.getTechProfile(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return ListView(
                      children: [
                        EditableInput(
                          placeholder: "Cédula",
                          value: snapshot.data.ci,
                          readOnly: true,
                        ),
                        EditableInput(
                          placeholder: "Nombre",
                          value: snapshot.data.nombre,
                          readOnly: true,
                        ),
                        EditableInput(
                          placeholder: "Apellido",
                          value: snapshot.data.apellido,
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
      bottomNavigationBar: NavigatorBar(index: 3),
    );
  }
}
