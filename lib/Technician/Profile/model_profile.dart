class TechProfile {
  String ci;
  String nombre;
  String apellido;

  TechProfile({this.ci, this.nombre, this.apellido});

  TechProfile.fromJson(Map<String, dynamic> json) {
    ci = json['nombre_razsoc'];
    nombre = json['cedula_rif'];
    apellido = json['apellido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre_razsoc'] = this.ci;
    data['cedula_rif'] = this.nombre;
    data['apellido'] = this.apellido;
    return data;
  }
}
