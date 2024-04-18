import 'dart:convert';

class LoginModel {
  final String phoneNumber;
  final String password;

  LoginModel({
    required this.phoneNumber,
    required this.password,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        phoneNumber: json["phone_number"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "password": password,
      };
}
