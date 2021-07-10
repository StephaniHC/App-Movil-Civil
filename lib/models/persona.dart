import 'dart:convert';

import 'package:app_movil_civil/global/environment.dart';

Persona personaFromJson(String str) => Persona.fromJson(json.decode(str));

String personaToJson(Persona data) => json.encode(data.toJson());

final base_url = Environment.apiUrl;

class Persona {
  Persona({
    this.id,
    this.nombre,
    this.apellido,
    this.ci,
    this.celular,
    this.direccion,
    this.email,
    this.fechaNac,
    // this.password,
  });

  String id;
  String nombre;
  String apellido;
  String ci;
  String celular;
  String img;
  String direccion;
  String email;
  String fechaNac;
  // String password;

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        ci: json["ci"],
        celular: json["celular"],
        direccion: json["direccion"],
        email: json["email"],
        fechaNac: json["fecha_nac"],
        // // password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "ci": ci,
        "celular": celular,
        "direccion": direccion,
        "email": email,
        "fecha_nac": fechaNac,
        // // "password": password,
      };

  // String get imagenUrl {
  //   if (this.img == null) {
  //     return '$base_url/upload/personas/no-image';
  //   } else if (this.img.contains('https')) {
  //     return this.img;
  //   } else if (this.img != null) {
  //     return '$base_url/upload/personas/${this.img}';
  //   } else {
  //     return '$base_url/upload/personas/no-image';
  //   }
  // }
}
