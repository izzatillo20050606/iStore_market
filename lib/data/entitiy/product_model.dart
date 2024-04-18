import 'dart:convert';

class GetProduct {
  final List<Product> products;

  GetProduct({
    required this.products,
  });

  factory GetProduct.fromRawJson(String str) =>
      GetProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetProduct.fromJson(Map<String, dynamic> json) => GetProduct(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int id;
  final String name;
  final int release;
  final dynamic image;

  Product({
    required this.id,
    required this.name,
    required this.release,
    required this.image,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        release: json["release"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "release": release,
        "image": image,
      };
}
