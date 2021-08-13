import 'dart:convert';

import 'package:app_movil_civil/global/environment.dart';

Civil civilFromJson(String str) => Civil.fromJson(json.decode(str));

String civilToJson(Civil data) => json.encode(data.toJson());

final base_url = Environment.apiUrl;

class Civil {
    Civil({
        this.id,
        this.descripcion,
        this.reputacion,
        this.denuncias,
        this.persona,
    });

    String id;
    String descripcion;
    String reputacion;
    List<dynamic> denuncias;
    String persona;

    factory Civil.fromJson(Map<String, dynamic> json) => Civil(
        id: json["_id"],
        descripcion: json["descripcion"],
        reputacion: json["reputacion"],
        denuncias: List<dynamic>.from(json["denuncias"].map((x) => x)),
        persona: json["persona"],
    );

       Map<String, dynamic> toJson() => {
        "_id": id,
        "descripcion": descripcion,
        "reputacion": reputacion,
        "denuncias": List<dynamic>.from(denuncias.map((x) => x)),
        "persona": persona,
    };



  // String get imagenUrl {
  //   if (this.img == null) {
  //     return '$base_url/upload/civils/no-image';
  //   } else if (this.img.contains('https')) {
  //     return this.img;
  //   } else if (this.img != null) {
  //     return '$base_url/upload/civils/${this.img}';
  //   } else {
  //     return '$base_url/upload/civils/no-image';
  //   }
  // }

}