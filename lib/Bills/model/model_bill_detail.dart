class BillDetail {
  String concepto;
  String monto;
  int cantidad;
  String total;

  BillDetail({this.concepto, this.monto, this.cantidad, this.total});

  BillDetail.fromJson(Map<String, dynamic> json) {
    concepto = json['concepto'];
    monto = json['monto'];
    cantidad = json['cantidad'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['concepto'] = this.concepto;
    data['monto'] = this.monto;
    data['cantidad'] = this.cantidad;
    data['total'] = this.total;
    return data;
  }
}
