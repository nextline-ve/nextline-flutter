class CurrencyModel {
  String simbolo;
  String moneda;
  bool aplicaAlicuota;

  CurrencyModel({this.simbolo, this.moneda, this.aplicaAlicuota});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    simbolo = json['simbolo'];
    moneda = json['moneda'];
    aplicaAlicuota = json['aplica_alicuota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['simbolo'] = this.simbolo;
    data['moneda'] = this.moneda;
    data['aplica_alicuota'] = this.aplicaAlicuota;
    return data;
  }
}
