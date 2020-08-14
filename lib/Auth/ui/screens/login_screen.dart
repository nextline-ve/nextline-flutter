import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Auth/bloc/bloc_auth.dart';
import 'package:nextline/Auth/ui/widgets/form_login.dart';
import 'package:nextline/Auth/ui/widgets/white_logo.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/line.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  BlocAuth blocAuth;
  @override
  Widget build(BuildContext context) {
    blocAuth = BlocProvider.of(context);
    // TODO: implement build
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: blocAuth.isActiveSession,
      builder: (context, snapshot)  {
        if (snapshot.data == null) {
          return Container(
              child:
              Center(child: CircularProgressIndicator()));
        }
        if (!snapshot.data) {
          return loginUI();
        }
        return HomeScreen();

      }
    );
  }

  Widget loginUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Background(path_image: "assets/images/fondo_login.png",),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WhiteLogo(),
                FormLogin(),
                Text(
                  "¿Olvido la contraseña?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "fontInput",
                  ),
                ),
                JButton(label: "INGRESAR", onTab: _setLogin, top: 30),
                Line(top: 30),
                JButton(
                  label: "SOLICITA TU SERVICIO",
                  onTab: _serviceRequest,
                  top: 30,
                  background: Color.fromRGBO(83, 224, 160, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _setLogin() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _serviceRequest() {
    Navigator.pushNamed(context, '/select-service');
  }
}
