import 'dart:convert';

class ResponseModel {
  bool success;
  dynamic data;

  ResponseModel({
    required this.success,
    required this.data,
  });

  factory ResponseModel.fromJson(String str) =>
      ResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromMap(Map<String, dynamic> json) => ResponseModel(
        success: json["success"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data,
      };
}
