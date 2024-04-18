
import 'dart:convert';

class DetailProductModel {
    final int id;
    final String name;
    final int release;
    final List<Spec> specs;
    final List<String> images;

    DetailProductModel({
        required this.id,
        required this.name,
        required this.release,
        required this.specs,
        required this.images,
    });

    factory DetailProductModel.fromRawJson(String str) => DetailProductModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailProductModel.fromJson(Map<String, dynamic> json) => DetailProductModel(
        id: json["id"],
        name: json["name"],
        release: json["release"],
        specs: List<Spec>.from(json["specs"].map((x) => Spec.fromJson(x))),
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "release": release,
        "specs": List<dynamic>.from(specs.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

class Spec {
    final String title;
    final String text;

    Spec({
        required this.title,
        required this.text,
    });

    factory Spec.fromRawJson(String str) => Spec.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Spec.fromJson(Map<String, dynamic> json) => Spec(
        title: json["title"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
    };
}
