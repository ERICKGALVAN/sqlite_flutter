import 'dart:convert';

List<DbModel> dbModelFromJson(String str) =>
    List<DbModel>.from(json.decode(str).map((x) => DbModel.fromJson(x)));

String dbModelToJson(List<DbModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DbModel {
  int id;
  String title;
  String description;

  DbModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory DbModel.fromJson(Map<String, dynamic> json) => DbModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };
}
