class IssueType {
  int id;
  String nombre;
  String image = "";

  IssueType({this.id, this.nombre});

  IssueType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['descripcion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descripcion'] = this.nombre;
    return data;
  }
}
