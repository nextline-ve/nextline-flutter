import 'package:flutter/material.dart';
import 'package:nextline/widgets/jtext_field.dart';

class FormLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormLogin();
  }

}

class _FormLogin extends State<FormLogin > {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _pass;
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            JTextField(isPass: false,
              label: "Correo Electrónico", inputType: TextInputType.emailAddress,
              icon: Icon(Icons.email, color: Color.fromRGBO(2, 144, 223, 1)),
              onKeyValue: (val) {
                _email = val;
                return val;
              },
              onValidator: (value) {
                if (value.isEmpty) {
                  return 'Por favor escriba su correo electrónico';
                }
                if (!emailRegex.hasMatch(value)) {
                  return 'Ingrese un correo electrónico válido';
                }
                return null;
              },
            ),
            JTextField(isPass: true,
              label: "Contraseña", inputType: TextInputType.text,
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
          ],
        ),
      ),
    );
  }

}