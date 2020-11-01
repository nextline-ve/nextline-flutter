import 'dart:convert';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class AppSession {
  static bool isLoggedIn = false;
  static ModelSession data;

  Future register(ModelSession _data) async {
    await _data.deleteObject();
    await _data.saveObject();
    AppSession.data = _data;
  }

  Future unregister() async {
    AppSession.data = null;
    await ModelSession().deleteObject();
    return true;
  }

  Future<bool> isActiveSession() async {
    ModelSession session = ModelSession();
    AppSession.data = await session.getObject(1);
    if (AppSession.data == null) {
      AppSession.isLoggedIn = false;
      return false;
    } else {
      AppSession.isLoggedIn = true;
      return true;
    }
  }
}

class ModelSession extends DatabaseHelper implements DataBaseInterface {
  String token;
  String avatar;
  String nombre;
  String tipoUsuario;
  String motivoRechazo;
  int idUsuario;
  int idPlan;
  int idServicio;
  int usuarioApp;
  bool esCliente;

  ModelSession(
      {this.token,
        this.avatar,
        this.nombre,
        this.tipoUsuario,
        this.motivoRechazo,
        this.idUsuario,
        this.idPlan,
        this.idServicio,
        this.esCliente,
        this.usuarioApp});

  ModelSession.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    avatar = json['avatar'];
    nombre = json['nombre'];
    tipoUsuario = json['tipo_usuario'];
    motivoRechazo = json['motivo_rechazo'];
    idUsuario = json['id_usuario'];
    idPlan = json['id_plan'];
    idServicio = json['id_servicio'];
    esCliente = json['es_cliente'];
    usuarioApp = json['usuario_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['avatar'] = this.avatar;
    data['nombre'] = this.nombre;
    data['tipo_usuario'] = this.tipoUsuario;
    data['motivo_rechazo'] = this.motivoRechazo;
    data['id_usuario'] = this.idUsuario;
    data['id_servicio'] = this.idServicio;
    data['id_plan'] = this.idPlan;
    data['es_cliente'] = this.esCliente;
    data['usuario_app'] = this.usuarioApp;
    return data;
  }

  Future deleteObject() async {
    final db = await database;

    // Remove the Dog from the Database.
    await db.delete(
      'cliente'
    );
  }

  @override
  Future getObject(int id) async {
    Database db = await this.database;
    try {
      List<Map> maps = await db.query('cliente',
          columns: ['*'], where: "id = ?", whereArgs: [id]);
      if (maps.length > 0) {
        AppSession.isLoggedIn = true;
        var data = json.decode(json.encode(maps.first));
        if (data['es_cliente'] == 1) {
          data['es_cliente'] = true;
        } else {
          data['es_cliente'] = false;
        }

        return ModelSession.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print("==== Es un nuevo celular ===");
      await _createTable();
      return null;
    }
  }

  @override
  Future<int> saveObject() async {
    Database db = await database;
    return await db.insert('cliente', toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<bool> _createTable() async {
    Database db = await database;
    db.execute("DROP TABLE IF EXISTS cliente;");
    db.execute(
      "CREATE TABLE cliente(id INTEGER PRIMARY KEY, "
          "token TEXT,"
          "avatar TEXT,"
          "nombre TEXT,"
          "tipo_usuario TEXT,"
          "motivo_rechazo TEXT,"
          "id_usuario INTEGER,"
          "id_plan INTEGER,"
          "id_servicio INTEGER,"
          "usuario_app INTEGER,"
          "es_cliente BOOLEAN)",
    );
    return true;
  }
}