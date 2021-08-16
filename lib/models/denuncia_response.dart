// To parse this JSON data, do
//
//  final DenunciaResponse = denunciaResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_movil_civil/models/civil.dart';
import 'package:app_movil_civil/models/denuncia.dart';
import 'package:app_movil_civil/models/oficial.dart';
import 'package:app_movil_civil/models/persona.dart';
import 'package:app_movil_civil/models/usuario.dart';

DenunciaResponse denunciaResponseFromJson(String str) =>
    DenunciaResponse.fromJson(json.decode(str));

String denunciaResponseToJson(DenunciaResponse data) =>
    json.encode(data.toJson());

class DenunciaResponse {
  DenunciaResponse({
    this.ok,
    this.denuncia,
    this.usuario,
    this.persona,
    // this.civil,
    this.oficial,
  });

  bool ok;
  Denuncia denuncia;
  Usuario usuario;
  Persona persona;
  Civil civil;
  Oficial oficial;
  String token;

  factory DenunciaResponse.fromJson(Map<String, dynamic> json) =>
      DenunciaResponse(
        ok: json["ok"],
        denuncia: Denuncia.fromJson(json["denuncia"]),
        usuario: Usuario.fromJson(json["usuario"]),
        persona: Persona.fromJson(json["persona"]),
        oficial: Oficial.fromJson(json["oficial"]),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "denuncia": denuncia.toJson(),
        "usuario": usuario.toJson(),
        "persona": persona.toJson(),
        "oficial": oficial.toJson(),
      };
}
