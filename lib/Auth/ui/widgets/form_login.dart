import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtext_field.dart';

class FormLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormLogin();
  }
}

class _FormLogin extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String pass;
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
            JTextField(
              isPass: false,
              label: "Correo Electrónico",
              inputType: TextInputType.emailAddress,
              icon: Icon(Icons.email, color: Color.fromRGBO(2, 144, 223, 1)),
              onKeyValue: (val) {
                email = val;
                return val;
              },
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
                pass = val;
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
            JButton(label: "INGRESAR", onTab: _setLogin, top: 30, background: AppColors.green_color,),
          ],
        ),
      ),
    );
  }

  void _setLogin() {
    print(_formKey.toString());
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }
}
