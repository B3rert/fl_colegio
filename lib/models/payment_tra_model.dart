import 'dart:convert';

class PaymentTraModel {
  int id;
  int cuentaId;
  int tipoTransaccionId;
  double monto;
  DateTime fecha;
  String descripcion;
  int realizadoPor;
  String numeroAutorizacion;

  PaymentTraModel({
    required this.id,
    required this.cuentaId,
    required this.tipoTransaccionId,
    required this.monto,
    required this.fecha,
    required this.descripcion,
    required this.realizadoPor,
    required this.numeroAutorizacion,
  });

  factory PaymentTraModel.fromJson(String str) =>
      PaymentTraModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentTraModel.fromMap(Map<String, dynamic> json) => PaymentTraModel(
        id: json["id"],
        cuentaId: json["cuenta_id"],
        tipoTransaccionId: json["tipo_transaccion_id"],
        monto: json["monto"]?.toDouble(),
        fecha: DateTime.parse(json["fecha"]),
        descripcion: json["descripcion"],
        realizadoPor: json["realizado_por"],
        numeroAutorizacion: json["numero_autorizacion"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cuenta_id": cuentaId,
        "tipo_transaccion_id": tipoTransaccionId,
        "monto": monto,
        "fecha": fecha.toIso8601String(),
        "descripcion": descripcion,
        "realizado_por": realizadoPor,
        "numero_autorizacion": numeroAutorizacion,
      };
}
