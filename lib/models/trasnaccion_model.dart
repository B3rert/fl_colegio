import 'dart:convert';

class TransaccionModel {
  int id;
  int cuentaId;
  double monto;
  dynamic fechaPago;
  int mes;
  int year;
  bool pagado;

  TransaccionModel({
    required this.id,
    required this.cuentaId,
    required this.monto,
    required this.fechaPago,
    required this.mes,
    required this.year,
    required this.pagado,
  });

  factory TransaccionModel.fromJson(String str) =>
      TransaccionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransaccionModel.fromMap(Map<String, dynamic> json) =>
      TransaccionModel(
        id: json["id"],
        cuentaId: json["cuenta_Id"],
        monto: json["monto"],
        fechaPago: json["fecha_Pago"],
        mes: json["mes"],
        year: json["año"],
        pagado: json["pagado"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cuenta_Id": cuentaId,
        "monto": monto,
        "fecha_Pago": fechaPago,
        "mes": mes,
        "año": year,
        "pagado": pagado,
      };
}
