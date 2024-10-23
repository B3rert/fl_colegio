import 'dart:convert';

class CuentaModel {
  int id;
  int alumnoId;
  int saldo;
  DateTime fechaApertura;
  bool solvente;

  CuentaModel({
    required this.id,
    required this.alumnoId,
    required this.saldo,
    required this.fechaApertura,
    required this.solvente,
  });

  factory CuentaModel.fromJson(String str) =>
      CuentaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CuentaModel.fromMap(Map<String, dynamic> json) => CuentaModel(
        id: json["id"],
        alumnoId: json["alumnoId"],
        saldo: json["saldo"],
        fechaApertura: DateTime.parse(json["fechaApertura"]),
        solvente: json["solvente"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "alumnoId": alumnoId,
        "saldo": saldo,
        "fechaApertura": fechaApertura.toIso8601String(),
        "solvente": solvente,
      };
}
