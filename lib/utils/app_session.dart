import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppSession {

  Future register(ModelSession _data) async {
    final prefs = await SharedPreferences.getInstance();
    String dataString = json.encode(_data.toJson());
    prefs.setString("session", dataString);
  }
  Future unregister() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("session");
  }

  Future<String>_getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("session") == null)  {
      return '';
    } else {
      prefs.getString("session");
    }
  }

  Future<bool>isActiveSession() async {
    String dataString = await _getPrefs();
    if (dataString.isEmpty || dataString == null) {
      return false;
    } else {
      return true;
    }
  }

  // get data => _getData();

  Future<ModelSession> getData() async{
    String dataString = await _getPrefs();
    if (dataString == null) {
      return null;
    } else {
      return ModelSession.fromJson(json.decode(dataString));
    }

  }
}

class ModelSession {
  String token;
  String nombre;
  String tipoUsuario;
  String motivoRechazo;
  int idUsuario;
  bool esCliente;

  ModelSession(
      {this.token,
        this.nombre,
        this.tipoUsuario,
        this.motivoRechazo,
        this.idUsuario,
        this.esCliente});

  ModelSession.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    nombre = json['nombre'];
    tipoUsuario = json['tipo_usuario'];
    motivoRechazo = json['motivo_rechazo'];
    idUsuario = json['id_usuario'];
    esCliente = json['es_cliente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['nombre'] = this.nombre;
    data['tipo_usuario'] = this.tipoUsuario;
    data['motivo_rechazo'] = this.motivoRechazo;
    data['id_usuario'] = this.idUsuario;
    data['es_cliente'] = this.esCliente;
    return data;
  }
}