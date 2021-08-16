// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

import 'package:app_movil_civil/global/environment.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

final base_url = Environment.apiUrl;

class Usuario {
  Usuario({
    this.estado,
    this.role,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.uid,
    this.img,
  });

  String estado;
  String role;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  String uid;
  String img;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        estado: json["estado"],
        role: json["role"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        uid: json["uid"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "role": role,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "uid": uid,
        "img": img,
      };

  String get imagenUrl {
    return '$base_url/uploads/usuarios/no-image';
  }
}
