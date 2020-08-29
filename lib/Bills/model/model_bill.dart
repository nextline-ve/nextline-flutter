enum BillStatus { C, G, P, V }

class Bill {
  int id;
  String fechaEmision;
  String iva;
  String alicuota;
  String monto;
  String subtotal;
  String total;
  BillStatus status;
  String comprobantePago;
  String getStatusDisplay;
  List<dynamic> cuentascobrarSet;

  Bill(
      {this.id,
      this.fechaEmision,
      this.iva,
      this.alicuota,
      this.monto,
      this.subtotal,
      this.total,
      this.status,
      this.comprobantePago,
      this.getStatusDisplay,
      this.cuentascobrarSet});

  Bill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fechaEmision = json['fecha_emision'];
    iva = json['iva'];
    alicuota = json['alicuota'];
    monto = json['monto'];
    subtotal = json['subtotal'];
    total = json['total'];
    status = _mapToBillStatus(json['status']);
    comprobantePago = json['comprobante_pago'] ?? "";
    getStatusDisplay = json['get_status_display'];
    cuentascobrarSet = json['cuentascobrar_set'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fecha_emision'] = this.fechaEmision;
    data['iva'] = this.iva;
    data['alicuota'] = this.alicuota;
    data['monto'] = this.monto;
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    data['status'] = this.status;
    data['comprobante_pago'] = this.comprobantePago;
    data['get_status_display'] = this.getStatusDisplay;
    data['cuentascobrar_set'] = this.cuentascobrarSet;
    return data;
  }

  BillStatus _mapToBillStatus(String status) {
    switch (status) {
      case "C":
        return BillStatus.C;
      case "G":
        return BillStatus.G;
      case "P":
        return BillStatus.P;
      case "V":
        return BillStatus.V;
    }
  }

  String mapToBillStatusString(BillStatus status) {
    switch (status) {
      case BillStatus.C:
        return "BillStatus.C";
      case BillStatus.G:
        return "BillStatus.G";
      case BillStatus.P:
        return "BillStatus.P";
      case BillStatus.V:
        return "BillStatus.V";
    }
  }
}
