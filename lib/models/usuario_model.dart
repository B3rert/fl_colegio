import 'dart:convert';

class UsuarioModel {
  int id;
  String usuario;
  String clave;
  String correo;
  int rolId;
  bool estado;

  UsuarioModel({
    required this.id,
    required this.usuario,
    required this.correo,
    required this.clave,
    required this.rolId,
    required this.estado,
  });

  factory UsuarioModel.fromJson(String str) =>
      UsuarioModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromMap(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        usuario: json["usuario"],
        correo: json["correo"],
        clave: json["clave"],
        rolId: json["rol_Id"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "usuario": usuario,
        "correo": correo,
        "clave": clave,
        "rol_Id": rolId,
        "estado": estado,
      };
}
