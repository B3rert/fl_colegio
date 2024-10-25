import 'dart:convert';

class PutPaymentTraModel {
  int traId;
  String autorizacion;

  PutPaymentTraModel({
    required this.traId,
    required this.autorizacion,
  });

  factory PutPaymentTraModel.fromJson(String str) =>
      PutPaymentTraModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PutPaymentTraModel.fromMap(Map<String, dynamic> json) =>
      PutPaymentTraModel(
        traId: json["traId"],
        autorizacion: json["autorizacion"],
      );

  Map<String, dynamic> toMap() => {
        "traId": traId,
        "autorizacion": autorizacion,
      };
}
