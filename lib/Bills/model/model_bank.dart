class BankModel {
  int id;
  String banco;
  String numeroCuenta;
  String nombre;
  String tipoMoneda;

  BankModel(
      {this.id, this.banco, this.numeroCuenta, this.nombre, this.tipoMoneda});

  BankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banco = json['banco'];
    numeroCuenta = json['numero_cuenta'];
    nombre = json['banco'];
    tipoMoneda = json['tipo_moneda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['banco'] = this.banco;
    data['numero_cuenta'] = this.numeroCuenta;
    data['tipo_moneda'] = this.tipoMoneda;
    return data;
  }
}
