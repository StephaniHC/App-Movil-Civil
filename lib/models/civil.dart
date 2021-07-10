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
  });

  String id;
  String descripcion;
  String reputacion;
  List<String> denuncias;

  factory Civil.fromJson(Map<String, dynamic> json) => Civil(
        id: json["id"],
        descripcion: json["descripcion"],
        reputacion: json["reputacion"],
        denuncias: List<String>.from(json["denuncias"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "reputacion": reputacion,
        "denuncias": denuncias,
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
