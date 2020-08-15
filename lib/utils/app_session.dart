import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class AppSession {
  static bool isLoggedIn = false;
  static ModelSession data;

  Future register(ModelSession _data) async {
    await _data.saveObject();
    AppSession.data = _data;
  }

  Future unregister() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("session");
  }

  Future<bool> isActiveSession() async {
    ModelSession session = ModelSession();
    AppSession.data = await session.getObject(1);
    if (AppSession.data == null) {
      return false;
    } else {
      AppSession.isLoggedIn = true;
      return true;
    }

  }

}

class ModelSession extends DatabaseHelper implements DataBaseInterface {
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

  @override
  Future getObject(int id) async {
    Database db = await this.database;
    try {
      List<Map> maps = await db.query('cliente',
          columns: ['*'],
          where: "id = ?",
          whereArgs: [id] );
      if (maps.length > 0) {
        return ModelSession.fromJson(maps.first);
      } else{
        return null;
      }
    } catch(e) {
      print(e);
      print("==== session ===");
      return null;
    }
  }

  @override
  Future<int> saveObject() async {
    Database db = await database;
    try {
      await _createTable();
    } catch (e) {
      print ("tabla existe");
    }
    return await db.insert('cliente', toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<bool> _createTable() async {
    Database db = await database;
    db.execute("DROP TABLE IF EXISTS cliente;");
    db.execute(
      "CREATE TABLE cliente(id INTEGER PRIMARY KEY, "
          "token TEXT,"
          "nombre TEXT,"
          "tipo_usuario TEXT,"
          "motivo_rechazo TEXT,"
          "id_usuario TEXT,"
          "es_cliente TEXT)",
    );
    return true;
  }
}
