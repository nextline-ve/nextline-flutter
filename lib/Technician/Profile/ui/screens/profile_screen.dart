import 'package:flutter/material.dart';
import 'package:nextline/Profile/bloc_profile.dart';
import 'package:nextline/Technician/Profile/model_profile.dart';
import 'package:nextline/Tickets/ui/widgets/background_tickets.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/utils/app_session.dart';
import 'package:nextline/widgets/confirmation_modal.dart';
import 'package:nextline/widgets/editable_input.dart';
import 'package:nextline/widgets/jloading_screen.dart';
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
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackgroundTickets(),
          Container(
            child: FutureBuilder<TechProfile>(
                future: blocProfile.getTechProfile(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
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
