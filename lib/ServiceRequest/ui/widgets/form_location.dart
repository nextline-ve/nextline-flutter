import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/bloc/bloc_service_request.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_http.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:url_launcher/url_launcher.dart';

class FormLocation extends StatefulWidget {
  final String address;
  final Map<String, dynamic> requestData;

  const FormLocation({Key key, this.address, this.requestData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormLocation();
  }
}

class _FormLocation extends State<FormLocation> {
  BlocServiceRequest blocService = BlocServiceRequest();
  final _formKey = GlobalKey<FormState>();
  final streamMessage = StreamController<String>();
  String _address;
  String _referencePoint;
  bool _makeRequest = false;

  @override
  void initState() {
    super.initState();
    streamMessage.stream.forEach((message) {
      if (message == "Solicitud Enviada con Éxito") {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
        Navigator.pushReplacementNamed(context, "/login");
      }

      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
    });
  }

  @override
  void dispose() {
    streamMessage.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(children: [
          JTextField(
            initialValue: widget.address,
            label: "Dirección",
            inputType: TextInputType.multiline,
            onKeyValue: (val) => _address = val,
          ),
          JTextField(
            label: "Punto de Referencia",
            inputType: TextInputType.multiline,
            onKeyValue: (val) => _referencePoint = val,
          ),
          _text("Antes de finalizar confirme", 60),
          _text("si su dirección es correcta", 1),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: StreamBuilder(
              stream: blocService.responseServiceRequest,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  streamMessage.add(snapshot.data);
                }
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                  print("ERRROR========");
                  streamMessage.add(snapshot.error.toString());
                  _makeRequest = false;
                }
                return Column(
                  children: [
                    JButton(
                      label: "FINALIZAR SOLICITUD",
                      onTab: _finish,
                      background: AppColors.ligth_blue_color,
                      icon: Icons.navigate_next,
                    ),
                    GestureDetector(
                      onTap: _launchURL,
                      child: Text(
                        'Al dar click en finalizar la solicitud está aceptando'
                        'las políticas de privacidad.',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }

  void _launchURL() async {
    String url = 'https://mynextline.net/privacy-policies';
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  Widget _text(txt, double top) {
    return Container(
      margin: EdgeInsets.only(top: top),
      child: Center(
          child: Text(
        txt,
        style: TextStyle(
            fontFamily: "fontTitle", color: Colors.white, fontSize: 20),
      )),
    );
  }

  void _finish() {
    if (_makeRequest) {
      return;
    }
    final form = _formKey.currentState;
    form.save();
    if (!form.validate()) {
      streamMessage.add('Verifique que haya cargado su dirección.');
      return;
    }
    _makeRequest = true;
    if (_referencePoint != '') {
      widget.requestData['direccion'] =
          '$_address. Punto de referencia: $_referencePoint';
    }

    print(widget.requestData);
    print("==== data enviada ====");
    AppHttp.requestIndicator(context);
    blocService.dataServiceRequest.add(widget.requestData);
  }
}
