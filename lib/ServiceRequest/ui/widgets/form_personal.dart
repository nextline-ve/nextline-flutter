import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';

class FormPersonal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormPersonal();
  }
}

class _FormPersonal extends State<FormPersonal> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _name;
  String _cedula;
  String _phone;
  String _pass;
  String _confirmpass;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              JTextField(
                isPass: false,
                inputType: TextInputType.text,
                label: "Nombre / Razón Social",
                onKeyValue: (val) {
                  _name = val;
                  return val;
                },
                onValidator: (value) {
                  if (value.length < 4) {
                    return 'Escriba el nombre o razón social completo';
                  }
                  if (value.isEmpty) {
                    return 'Por favor, complete el campo de Nombre / Razón Social';
                  }
                  return null;
                },
                maxLength: 100,
              ),
              JTextField(
                isPass: false,
                inputType: TextInputType.text,
                label: "Cédula / Rif",
                onKeyValue: (val) {
                  _cedula = val;
                  return val;
                },
                onValidator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, complete el campo de Cédula / Rif';
                  }
                  return null;
                },
              ),
              JTextField(
                isPass: false,
                inputType: TextInputType.phone,
                label: "Número de Teléfono",
                onKeyValue: (val) {
                  _phone = val;
                  return val;
                },
                onValidator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, complete el campo de Número de Teléfono';
                  }
                  return null;
                },
              ),
              JTextField(
                isPass: false,
                inputType: TextInputType.emailAddress,
                label: "Correo Electrónico",
                onKeyValue: (val) => _email = val,
                onValidator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, escriba su correo electrónico';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Ingresa un correo electrónico válido';
                  }
                  return null;
                },
              ),
              JTextField(
                isPass: true,
                label: "Contraseña",
                inputType: TextInputType.text,
                onValidator: (value) {
                  if (value.length < 8) {
                    return 'La contraseña debe ser mínimo 8 caracteres.';
                  }
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
              JTextField(
                isPass: true,
                inputType: TextInputType.text,
                label: "Confirmar Contraseña",
                onKeyValue: (val) => _confirmpass = val,
                onValidator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, confirme su Contraseña';
                  }
                  return null;
                },
              ),
              JButton(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  label: "CONTINUAR",
                  onTab: _makeForm,
                  background: AppColors.ligth_blue_color),
            ],
          ),
        ));
  }

  void _makeForm() async {
    final form = _formKey.currentState;
    form.save();
    if (!form.validate()) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Verifique que haya cargado los datos correctamente')));
      return;
    }
    if (_pass != _confirmpass) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Verifique que haya cargado los datos correctamente')));
      return;
    }
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    prefs.setString(
        "dataPersonal",
        jsonEncode({
          "correo": _email,
          "nombre_razsoc": _name,
          "cedula_rif": _cedula,
          "celular": _phone,
          "clave": _pass,
          "plan": prefs.getInt("plan"),
          "latitud": 0,
          "longitud": 0,
          "direccion": "",
          "avatar": "",
        }));
    prefs.remove("service");
    prefs.remove("plan");

    Navigator.pushNamed(context, '/installation');
  }
}
