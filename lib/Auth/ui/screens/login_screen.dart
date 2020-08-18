import 'package:flutter/material.dart';
import 'package:nextline/Auth/bloc/bloc_auth.dart';
import 'package:nextline/Auth/ui/widgets/form_login.dart';
import 'package:nextline/Auth/ui/widgets/white_logo.dart';
import 'package:nextline/utils/app_colors.dart';
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
    return loginUI();
  }

  Widget loginUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Background(
            pathImage: "assets/images/fondo_login.png",
          ),
          ListView(
            children: [
              WhiteLogo(),
              FormLogin(),
              Line(top: 0, width: 100,),
              JButton(
                label: "SOLICITA TU SERVICIO",
                onTab: _serviceRequest,
                background: AppColors.ligth_blue_color,
              ),
            ],
          )
        ],
          
      ),
    );
  }

  void _serviceRequest() {
    Navigator.pushNamed(context, '/select-service');
  }
}
