class ProfileModel {
  String nombreRazsoc;
  String cedulaRif;
  String correo;
  String avatar;

  ProfileModel({this.nombreRazsoc, this.cedulaRif, this.correo, this.avatar});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    nombreRazsoc = json['nombre_razsoc'];
    cedulaRif = json['cedula_rif'];
    correo = json['correo'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre_razsoc'] = this.nombreRazsoc;
    data['cedula_rif'] = this.cedulaRif;
    data['correo'] = this.correo;
    data['avatar'] = this.avatar;
    return data;
  }
}
