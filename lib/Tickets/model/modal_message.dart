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
    date = json['date'] != null ? json['date'] : "";
  }

  ModelMessage.fromSnapshot(Map<dynamic, dynamic> json) {
    customId = json['customId'].toString();
    type = json['type'];
    message = json['message'];
    imageUrl = json['imageUrl'] ?? "";
    date = json['date'] != null ? parseDate(json['date']) : "";
  }

  String parseDate(String date) {
    List<String> dateData = date.split("/");
    List<String> yearAndTime = dateData[2].split(" ");
    return "${yearAndTime[0]}-${parseNumber(dateData[1])}-${parseNumber(dateData[0])} ${yearAndTime[1]}:00";
  }

  String parseNumber(String numberUnparsed) {
    int number = int.parse(numberUnparsed);
    if (number < 10) {
      return "0" + numberUnparsed;
    }
    return numberUnparsed;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customId'] = this.customId;
    data['type'] = this.type;
    data['message'] = this.message;
    data['imageUrl'] = this.imageUrl ?? "";
    data['date'] = this.date != null ? this.date : "";
    return data;
  }
}
