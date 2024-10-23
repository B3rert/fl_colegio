import 'dart:convert';

class LoginModel {
  String user;
  String password;

  LoginModel({
    required this.user,
    required this.password,
  });

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        user: json["user"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "user": user,
        "password": password,
      };
}
