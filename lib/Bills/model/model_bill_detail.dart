class BillDetail {
  String concepto;
  String total;
  String total_bs;
  String monto_bs;
  int cantidad;
  bool descuento;
  double monto_concepto;

  BillDetail({this.concepto,
    this.descuento,
    this.monto_concepto,
    this.cantidad,
    this.monto_bs,
    this.total,
    this.total_bs
  });

  BillDetail.fromJson(Map<String, dynamic> json) {
    concepto = json['concepto'];
    monto_bs = 'Bs. ' + json['monto_bs'].toString();
    cantidad = json['cantidad'];
    descuento = json['descuento'];
    monto_concepto = json['monto_concepto'];
    total_bs = 'Bs. ' + json['total_bs'].toString();
    total = json['total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['concepto'] = this.concepto;
    data['total'] = this.total;
    data['total_bs'] = this.total_bs;
    data['monto_bs'] = this.monto_bs;
    data['cantidad'] = this.cantidad;
    data['descuento'] = this.descuento;
    data['monto_concepto'] = this.monto_concepto;
    return data;
  }
}
