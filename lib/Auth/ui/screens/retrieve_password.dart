import 'package:flutter/material.dart';
import 'package:nextline/Auth/bloc/bloc_auth.dart';
import 'package:nextline/Auth/ui/widgets/form_retrieve_password.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/background.dart';

class RetrievePassword extends StatefulWidget {
  final BlocAuth blocAuth;
  RetrievePassword({Key key, @required this.blocAuth}) : super(key: key);
  @override
  _RetrievePassword createState() => _RetrievePassword();
}

class _RetrievePassword extends State<RetrievePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue_dark,
          title: Text(
            'RECUPERAR CONTRASEÑA',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Background(pathImage: "assets/images/bg.jpg"),
            FormRetrievePassword(blocAuth: widget.blocAuth)
          ],
        ));
  }
}
