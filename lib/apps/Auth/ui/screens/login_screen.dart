import 'package:flutter/material.dart';
import 'package:nextline/apps/Auth/ui/widgets/background_login.dart';
import 'package:nextline/apps/Auth/ui/widgets/form_login.dart';
import 'package:nextline/apps/Auth/ui/widgets/white_logo.dart';
import 'package:nextline/widgets/jbutton.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackgroundLogin(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WhiteLogo(),
              FormLogin(),
              Text(
                "¿Olvido la contraseña?",
                style: TextStyle(color: Colors.white),
              ),
              JButton(label: "INGRESAR", onTab: _setLogin, top: 30),
              JButton(
                label: "SOLICITA TU SERVICIO",
                onTab: _setLogin,
                top: 60,
                background: Color.fromRGBO(83, 224, 160, 1),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _setLogin() {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Processing Data')));
  }
}
