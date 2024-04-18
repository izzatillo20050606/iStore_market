
class RegisterModel {
  final String phoneNumber;
  final String password;
  final String password2;
  final String firstName;
  final String lastName;

  RegisterModel({
    required this.phoneNumber,
    required this.password,
    required this.password2,
    required this.firstName,
    required this.lastName,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
      phoneNumber: json["phoneNumber"],
      password: json["password1"],
      password2: json["password2"],
      firstName: json["firsNname"],
      lastName: json["lastName"]);

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "password": password,
        "password2": password2,
        "first_name": firstName,
        "last_name": lastName,
      };
}
