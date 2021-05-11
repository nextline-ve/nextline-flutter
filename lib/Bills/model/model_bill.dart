import 'package:nextline/Bills/model/model_bill_detail.dart';

enum BillStatus { C, G, P, V }

class Bill {
  int id;
  String fechaEmision;
  String iva;
  String alicuota;
  String montoIva;
  String montoAlicuota;
  String montoDescuento;
  String montoBase;
  String subtotal;
  String total;
  BillStatus status;
  String statusDisplay;
  String comprobantePago;
  String getStatusDisplay;
  List<BillDetail> facturaDetalleSet;
  List<dynamic> cuentascobrarSet;

  String montoIvaBs;
  String montoAlicuotaBs;
  String montoDescuentoBs;
  String montoBaseBs;
  String subtotalBs;
  String totalBs;

  Bill(
      {this.id,
      this.fechaEmision,
      this.iva,
      this.alicuota,
      this.montoIva,
      this.montoAlicuota,
      this.montoDescuento,
      this.montoBase,
      this.subtotal,
      this.total,
      this.status,
      this.comprobantePago,
      this.getStatusDisplay,
      this.facturaDetalleSet,
      this.cuentascobrarSet,
      this.montoIvaBs,
      this.montoAlicuotaBs,
      this.montoDescuentoBs,
      this.montoBaseBs,
      this.subtotalBs,
      this.totalBs,});

  Bill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fechaEmision = json['fecha_emision'];
    iva = json['iva'];
    alicuota = json['alicuota'];
    montoIva = json['monto_iva'];
    montoAlicuota = json['monto_alicuota'];
    montoDescuento = json['monto_descuento'];
    montoBase = json['monto_base'];
    subtotal = json['subtotal'];
    total = json['total'];
    statusDisplay = json['get_status_display'];
    status = _mapToBillStatus(json['status']);
    comprobantePago = json['comprobante_pago'] ?? "";
    getStatusDisplay = json['get_status_display'];
    cuentascobrarSet = json['cuentascobrar_set'];

    facturaDetalleSet = json['factuaradetalle_set']
        .map<BillDetail>((json) => BillDetail.fromJson(json))
        .toList();
    montoIvaBs = json['monto_iva_bs'];
    montoAlicuotaBs = json['monto_alicuota_bs'];
    montoDescuentoBs = json['monto_descuento_bs'];
    montoBaseBs = json['monto_base_bs'];
    subtotalBs = json['subtotal_bs'];
    totalBs = json['total_bs'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fecha_emision'] = this.fechaEmision;
    data['iva'] = this.iva;
    data['alicuota'] = this.alicuota;
    data['monto_iva'] = this.montoIva;
    data['monto_alicuota'] = this.montoAlicuota;
    data['monto_descuento'] = this.montoDescuento;
    data['monto_base'] = this.montoBase;
    data['subtotal'] = this.subtotal;
    data['total'] = this.total;
    data['status'] = this.status;
    data['comprobante_pago'] = this.comprobantePago;
    data['get_status_display'] = this.getStatusDisplay;
    data['cuentascobrar_set'] = this.cuentascobrarSet;

    data['monto_iva_bs'] = this.montoIvaBs;
    data['monto_alicuota_bs'] = this.montoAlicuotaBs;
    data['monto_descuento_bs'] = this.montoDescuentoBs;
    data['monto_base_bs'] = this.montoBaseBs;
    data['subtotal_bs'] = this.subtotalBs;
    data['total_bs'] = this.totalBs;
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
      default:
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
        return "Vigente";
      default:
        return "";
    }
  }

  String getTotal(String simbolo, Bill bill) {
    switch(simbolo) {
      case 'USD':
        return bill.total + ' USD';
      default:
        return bill.totalBs;
    }
  }
}
