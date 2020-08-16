import 'dart:async';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Auth/bloc/bloc_auth.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_http.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtext_field.dart';

class FormLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormLogin();
  }
}

class _FormLogin extends State<FormLogin> {
  BlocAuth blocAuth;
  final _formKey = GlobalKey<FormState>();
  final streamMessageLogin = StreamController<String>();
  String _email;
  String _pass;
  bool _makeRequest = false;

  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  @override
  void initState() {
    super.initState();
    streamMessageLogin.stream.forEach((message) {
      if (message == "Bienvenido") {
        Navigator.pushReplacementNamed(context, "/home");
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
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            JTextField(
              isPass: false,
              label: "Correo Electrónico",
              inputType: TextInputType.emailAddress,
              icon: Icon(Icons.email, color: Color.fromRGBO(2, 144, 223, 1)),
              onKeyValue: (val) => _email = val,
              onValidator: (val) {
                if (val.isEmpty) {
                  return 'Por favor escriba su correo electrónico';
                }
                if (!emailRegex.hasMatch(val)) {
                  return 'Ingrese un correo electrónico válido';
                }
                return null;
              },
            ),
            JTextField(
              isPass: true,
              label: "Contraseña",
              inputType: TextInputType.text,
              icon: Icon(Icons.vpn_key, color: Color.fromRGBO(2, 144, 223, 1)),
              onValidator: (value) {
                if (value.isEmpty) {
                  return 'Por favor escriba su contraseña';
                }
                return null;
              },
              onKeyValue: (val) {
                _pass = val;
                return val;
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 1, bottom: 10),
              child: Text(
                "¿Olvido la contraseña?",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "fontInput",
                ),
              ),
            ),
            StreamBuilder(
              stream: blocAuth.responseMakeLogin,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  _makeRequest = false;
                  print(snapshot.error.toString());
                  streamMessageLogin.add(snapshot.error.toString());
                } else {
                  if (snapshot.hasData && snapshot.data) {
                    streamMessageLogin.add("Bienvenido");
                  }
                }

                return JButton(
                  label: "INGRESAR",
                  onTab: _setMakeLogin,
                  top: 30,
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
    print("a");
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
