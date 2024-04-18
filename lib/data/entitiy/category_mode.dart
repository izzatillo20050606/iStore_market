import 'dart:convert';

List<Category> categoreFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));
String categoreToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  final String title;
  final String image;
  final String id;
  Category({
    required this.title,
    required this.image,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "id": id,
      };
}
