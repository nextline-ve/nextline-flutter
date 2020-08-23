import 'package:dio/dio.dart';

enum TicketType { C, R, I }

enum TicketStatus { P, C, S, A, F }

class Ticket {
  int id;
  TicketType tipo;
  String fechaCreacion;
  TicketStatus status;
  String getStatusDisplay;
  int asunto;
  String detalle;
  int cliente;
  // String asuntoDescripcion;

  Ticket({
    this.id,
    this.tipo,
    this.fechaCreacion,
    this.status,
    this.getStatusDisplay,
    this.asunto,
    this.detalle,
    this.cliente,
    // this.asuntoDescripcion
  });
  Ticket.fromPartial({this.detalle, this.asunto});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipo = _mapToTicketType(json['tipo']);
    fechaCreacion = json['fecha_creacion'];
    status = _mapToTicketStatus(json['status']);
    getStatusDisplay = json['get_status_display'];
    asunto = json['asunto'];
    detalle = json['detalle'];
    cliente = json['cliente'];
    // asuntoDescripcion = json['asunto__descripcion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tipo'] = this.tipo;
    data['fecha_creacion'] = this.fechaCreacion;
    data['status'] = this.status;
    data['get_status_display'] = this.getStatusDisplay;
    data['asunto'] = this.asunto;
    data['detalle'] = this.detalle;
    data['cliente'] = this.cliente;
    // data['asunto__descripcion'] = this.asuntoDescripcion;
    return data;
  }

  Map<String, dynamic> partialtoJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['asunto'] = this.asunto;
    data['detalle'] = this.detalle;
    return data;
  }

  TicketType _mapToTicketType(String type) {
    switch (type) {
      case "C":
        return TicketType.C;
      case "R":
        return TicketType.R;
      case "I":
        return TicketType.I;
      default:
        return null;
    }
  }

  TicketStatus _mapToTicketStatus(String status) {
    switch (status) {
      case "A":
        return TicketStatus.A;
      case "C":
        return TicketStatus.C;
      case "F":
        return TicketStatus.F;
      case "P":
        return TicketStatus.P;
      case "S":
        return TicketStatus.S;
      default:
        return null;
    }
  }

  String mapToTicketTypeString(TicketType type) {
    switch (type) {
      case TicketType.C:
        return "Cambio de Plan";
      case TicketType.R:
        return "Reparación";
      case TicketType.I:
        return "Instalación";
      default:
        return null;
    }
  }

  String mapToTicketStatusString(TicketStatus status) {
    switch (status) {
      case TicketStatus.A:
        return "Asignado al Ténico";
      case TicketStatus.C:
        return "Atención en Curso";
      case TicketStatus.F:
        return "Finalizado";
      case TicketStatus.P:
        return "Pendiente por Atención";
      case TicketStatus.S:
        return "Pendiente por Soporte Técnico";
      default:
        return null;
    }
  }

  FormData toFormData() {
    return FormData.fromMap(this.partialtoJson());
  }
}
