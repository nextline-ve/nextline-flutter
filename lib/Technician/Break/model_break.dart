import 'package:dio/dio.dart';

class Break {
  int id;
  String hora;
  String minutos;
  String fecha;
  int motivo;
  String tecnico;

  Break(
      {this.id,
      this.hora,
      this.minutos,
      this.fecha,
      this.motivo,
      this.tecnico});

  Break.fromPartial(
      {this.hora, this.minutos, this.fecha, this.motivo, this.tecnico});

  Break.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hora = json['hora'];
    minutos = json['minutos'];
    fecha = json['fecha'];
    motivo = json['motivo'];
    tecnico = json['tecnico'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hora'] = this.minutos;
    data['minutos'] = this.minutos;
    data['fecha'] = this.fecha;
    data['motivo'] = this.motivo;
    data['tecnico'] = this.tecnico;
    return data;
  }

  Map<String, dynamic> partialtoJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hora'] = this.minutos;
    data['minutos'] = this.minutos;
    data['fecha'] = this.fecha;
    data['motivo'] = this.motivo;
    data['tecnico'] = this.tecnico;
    return data;
  }

  FormData toFormData() {
    return FormData.fromMap(this.partialtoJson());
  }
}
