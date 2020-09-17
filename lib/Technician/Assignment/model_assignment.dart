import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nextline/Tickets/model/model_ticket.dart';

class Assignment {
  String horaEntrada;
  String horaSalida;
  String observacion;
  String firmaCliente;
  String fotoUno;
  String fotoDos;
  String fotoTres;
  String fotoCuatro;
  Ticket ticket;
  bool realizado;

  Assignment({this.horaEntrada, this.horaSalida, this.observacion});
  Assignment.fromPartial({this.ticket});

  Assignment.fromJson(Map<String, dynamic> json) {
    horaEntrada = json['hora_entrada'];
    horaSalida = json['hora_entrada'];
    observacion = json['observacion'];
    firmaCliente = json['firma_cliente'];
    fotoUno = json['foto_uno'];
    fotoDos = json['foto_dos'];
    fotoTres = json['foto_tres'];
    fotoCuatro = json['foto_cuatro'];
    ticket = json['ticket'];
    realizado = json['realizado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hora_entrada'] = this.horaEntrada;
    data['tipo'] = this.horaSalida;
    data['observacion'] = this.observacion;
    data['firmaCliente'] = this.firmaCliente;
    data['foto_uno'] = this.fotoUno;
    data['foto_dos'] = this.fotoDos;
    data['foto_tres'] = this.fotoTres;
    data['foto_cuatro'] = this.fotoCuatro;
    data['ticket'] = this.ticket;
    data['realizado'] = this.realizado;
    return data;
  }

  FormData toFormData() {
    return FormData.fromMap(this.toJson());
  }

  static String imageToBase64(String url) {
    return base64Encode(File(url).readAsBytesSync());
  }
}
