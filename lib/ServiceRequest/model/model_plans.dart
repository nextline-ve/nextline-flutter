class ModelPlans {
  int id;
  String plan;
  String precio;
  String precioCurrency;
  bool activo;
  TipoServicio tipoServicio;
  String precioBs;
  String velocidadSubida;
  String velocidadBaja;

  ModelPlans(
      {this.id,
        this.plan,
        this.precio,
        this.precioCurrency,
        this.activo,
        this.tipoServicio,
        this.precioBs,
        this.velocidadSubida,
        this.velocidadBaja});

  ModelPlans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plan = json['plan'];
    precio = json['precio'];
    precioCurrency = json['precio_currency'];
    activo = json['activo'];
    tipoServicio = json['tipo_servicio'] != null
        ? new TipoServicio.fromJson(json['tipo_servicio'])
        : null;
    precioBs = json['precio_bs'];
    velocidadSubida = json['velocidad_subida'];
    velocidadBaja = json['velocidad_baja'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan'] = this.plan;
    data['precio'] = this.precio;
    data['precio_currency'] = this.precioCurrency;
    data['activo'] = this.activo;
    if (this.tipoServicio != null) {
      data['tipo_servicio'] = this.tipoServicio.toJson();
    }
    data['precio_bs'] = this.precioBs;
    data['velocidad_subida'] = this.velocidadSubida;
    data['velocidad_baja'] = this.velocidadBaja;
    return data;
  }
}

class TipoServicio {
  int id;
  String servicio;
  bool activo;

  TipoServicio({this.id, this.servicio, this.activo});

  TipoServicio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    servicio = json['servicio'];
    activo = json['activo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['servicio'] = this.servicio;
    data['activo'] = this.activo;
    return data;
  }
}