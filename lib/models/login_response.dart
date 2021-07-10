// To parse this JSON data, do
//
//  final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_movil_civil/models/civil.dart';
import 'package:app_movil_civil/models/oficial.dart';
import 'package:app_movil_civil/models/persona.dart';
import 'package:app_movil_civil/models/usuario.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.ok,
    this.usuario,
    this.persona,
    this.civil,
    // this.oficial,
    this.token,
  });

  bool ok;
  Usuario usuario;
  Persona persona;
  Civil civil;
  // Oficial oficial;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        persona: Persona.fromJson(json["persona"]),
        civil: Civil.fromJson(json["data"]),
        // oficial: Oficial.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "persona": persona.toJson(),
        "civil": civil.toJson(),
        // "oficial": oficial.toJson(),
        "token": token,
      };
}
