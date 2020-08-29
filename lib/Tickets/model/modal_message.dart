class ModelMessage {
  String customId;
  String type;
  String message;
  String imageUrl;
  String date;

  ModelMessage(
      {this.customId, this.type, this.message, this.imageUrl, this.date});

  ModelMessage.fromJson(Map<String, dynamic> json) {
    customId = json['customId'];
    type = json['type'];
    message = json['message'];
    imageUrl = json['imageUrl'];
    date = json['date'];
  }

  ModelMessage.fromSnapshot(Map<dynamic, dynamic> json) {
    customId = json['customId'];
    type = json['type'];
    message = json['message'];
    imageUrl = json['imageUrl'] ?? "";
    date = json['date'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customId'] = this.customId;
    data['type'] = this.type;
    data['message'] = this.message;
    data['imageUrl'] = this.imageUrl ?? "";
    data['date'] = this.date ?? "";
    return data;
  }
}
