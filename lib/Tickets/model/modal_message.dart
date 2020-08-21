class ModelMessage {
  String user;
  String type;
  String message;
  String imageUrl;

  ModelMessage({this.user, this.type, this.message, this.imageUrl});

  ModelMessage.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    type = json['type'];
    message = json['message'];
    imageUrl = json['imageUrl'];
  }

  ModelMessage.fromSnapshot(Map<dynamic, dynamic> json) {
    user = json['user'];
    type = json['type'];
    message = json['message'];
    imageUrl = json['imageUrl'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['type'] = this.type;
    data['message'] = this.message;
    data['imageUrl'] = this.imageUrl ?? "";
    return data;
  }
}
