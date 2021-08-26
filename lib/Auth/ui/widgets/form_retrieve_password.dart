import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Auth/bloc/bloc_auth.dart';
import 'package:nextline/Auth/ui/widgets/form_login.dart';
import 'package:nextline/Auth/ui/widgets/white_logo.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_http.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtext_field.dart';

class FormRetrievePassword extends StatefulWidget {
  final BlocAuth blocAuth;

  FormRetrievePassword({Key key, @required this.blocAuth}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormRetrievePassword();
  }
}

class _FormRetrievePassword extends State<FormRetrievePassword> {
  String _email;

  @override
  Widget build(BuildContext context) {
    BlocAuth blocAuth = BlocProvider.of(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8),
      children: [
        WhiteLogo(),
        JTextField(
          isPass: false,
          label: "Correo Electrónico",
          inputType: TextInputType.emailAddress,
          icon: Icon(Icons.email, color: Color.fromRGBO(2, 144, 223, 1)),
          onKeyValue: (val) => _email = val,
          onValidator: (val) => FormLogin.validateEmail(val),
        ),
        JButton(
          label: "RECUPERAR CONTRASEÑA",
          onTab: () {
            if (_email == null || FormLogin.validateEmail(_email) != null) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Verifique que haya colocado el correo electrónico correctamente')));
              return;
            }
            AppHttp.requestIndicator(context);
            blocAuth
                .retrievePassword({"email": _email})
                .then((value) => Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Se le ha enviado un email para recuperar su contraseña'))))
                .catchError((onError) => Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(onError))));
          },
          background: AppColors.ligth_blue_color,
        ),
      ],
    );
  }
}
