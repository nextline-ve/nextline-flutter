class ModelServices {
  int id;
  String servicio;
  bool activo;
  String error;

  ModelServices({this.id, this.servicio, this.activo});

  ModelServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    servicio = json['servicio'];
    activo = json['activo'];
  }

  ModelServices.withError(String errorValue) {
        error = errorValue;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['servicio'] = this.servicio;
    data['activo'] = this.activo;
    return data;
  }
}