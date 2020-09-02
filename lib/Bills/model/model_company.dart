class CompanyModel {
  String logo;
  String rif;
  String razsoc;
  String direccion;
  String telefono;
  String correo;
  int compromisoPago;

  CompanyModel(
      {this.logo,
      this.rif,
      this.razsoc,
      this.direccion,
      this.telefono,
      this.correo,
      this.compromisoPago});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    rif = json['rif'];
    razsoc = json['razsoc'];
    direccion = json['direccion'];
    telefono = json['telefono'];
    correo = json['correo'];
    compromisoPago = json['compromiso_pago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    data['rif'] = this.rif;
    data['razsoc'] = this.razsoc;
    data['direccion'] = this.direccion;
    data['telefono'] = this.telefono;
    data['correo'] = this.correo;
    data['compromiso_pago'] = this.compromisoPago;
    return data;
  }
}
