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
    this.online,
    this.nombre,
    this.email,
    this.img,
    this.uid,
    this.role = "CIVIL_ROLE",
  });

  bool online;
  String nombre;
  String email;
  String img;
  String uid;
  String role;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        online: json["online"],
        nombre: json["nombre"],
        email: json["email"],
        img: json["img"],
        uid: json["uid"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "online": online,
        "nombre": nombre,
        "email": email,
        "img": img,
        "uid": uid,
        "role": role,
      };

  // String get imagenUrl {
  //   if (this.img == null) {
  //     return '$base_url/upload/usuarios/no-image';
  //   } else if (this.img.contains('https')) {
  //     return this.img;
  //   } else if (this.img != null) {
  //     return '$base_url/upload/usuarios/${this.img}';
  //   } else {
  //     return '$base_url/upload/usuarios/no-image';
  //   }
  // }
}
