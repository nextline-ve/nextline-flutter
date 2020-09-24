import 'dart:async';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Auth/bloc/bloc_auth.dart';
import 'package:nextline/Auth/ui/screens/retrieve_password.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_http.dart';
import 'package:nextline/utils/app_session.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtext_field.dart';

class FormLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormLogin();
  }

  static String validateEmail(email) {
    final RegExp emailRegex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Por favor, escriba su correo electrónico';
    }
    if (!emailRegex.hasMatch(email)) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }
}

class _FormLogin extends State<FormLogin> {
  BlocAuth blocAuth;
  final _formKey = GlobalKey<FormState>();
  final streamMessageLogin = StreamController<String>();
  String _email;
  String _pass;
  bool _makeRequest = false;

  @override
  void initState() {
    super.initState();
    streamMessageLogin.stream.forEach((message) {
      if (message == "Bienvenido") {
        switch (AppSession.data.tipoUsuario) {
          case "T":
            Navigator.pushReplacementNamed(context, "/technician-home");
            break;
          default:
            Navigator.pushReplacementNamed(context, "/home");
        }
      }
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
    });
  }

  @override
  void dispose() {
    streamMessageLogin.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    blocAuth = BlocProvider.of(context);

    return formUI();
  }

  Widget formUI() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            JTextField(
              isPass: false,
              label: "Correo Electrónico",
              inputType: TextInputType.emailAddress,
              icon: Icon(Icons.email, color: Color.fromRGBO(2, 144, 223, 1)),
              onKeyValue: (val) => _email = val,
              onValidator: (val) => FormLogin.validateEmail(val),
            ),
            JTextField(
              isPass: true,
              label: "Contraseña",
              inputType: TextInputType.text,
              icon: Icon(Icons.vpn_key, color: Color.fromRGBO(2, 144, 223, 1)),
              onValidator: (value) {
                if (value.isEmpty) {
                  return 'Por favor, escriba su contraseña';
                }
                return null;
              },
              onKeyValue: (val) {
                _pass = val;
                return val;
              },
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RetrievePassword(
                          blocAuth: this.blocAuth,
                        )),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 1, bottom: 10),
                child: Text(
                  "¿Olvidó su contraseña?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "fontInput",
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: blocAuth.responseMakeLogin,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  _makeRequest = false;
                  streamMessageLogin.add(snapshot.error.toString());
                } else {
                  _makeRequest = false;
                  if (snapshot.hasData && snapshot.data) {
                    streamMessageLogin.add("Bienvenido");
                  }
                }

                return JButton(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  label: "INGRESAR",
                  onTab: _setMakeLogin,
                  background: AppColors.green_color,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _setMakeLogin() {
    if (_makeRequest) {
      return;
    }
    final form = _formKey.currentState;
    form.save();
    if (!form.validate()) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Verifique que haya cargado los datos correctamente')));
      return;
    }
    _makeRequest = true;
    AppHttp.requestIndicator(context);
    blocAuth.dataForLogin.add({'email': _email, 'clave': _pass});
  }
}
