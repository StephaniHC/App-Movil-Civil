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
    this.celular,
    this.direccion,
    this.ci, 
    this.email,
    this.fechaNac,
    this.usuario,
  });

  String id;
  String nombre;
  String apellido;
  String celular;
  String direccion;
  String ci; 
  String img;
  String email;
  String fechaNac;
  String usuario;

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        id: json["_id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        celular: json["celular"],
        direccion: json["direccion"],
        ci: json["ci"],  
        email: json["email"],
        fechaNac: json["fecha_nac"],
        usuario: json["usuario"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "apellido": apellido,
        "celular": celular,
        "ci": ci,
        "direccion": direccion,
        "email": email,
        "fecha_nac": fechaNac,
        "usuario": usuario,
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



