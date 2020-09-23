class Reason {
  int id;
  String motivo;
  String nombre;

  Reason({this.id, this.motivo});

  Reason.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    motivo = json['motivo'];
    nombre = json['motivo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['motivo'] = this.motivo;
    return data;
  }
}
