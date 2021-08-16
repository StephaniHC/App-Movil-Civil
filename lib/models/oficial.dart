import 'dart:convert';

Oficial oficialFromJson(String str) => Oficial.fromJson(json.decode(str));

String oficialToJson(Oficial data) => json.encode(data.toJson());

class Oficial {
  Oficial({
    this.id,
    this.descripcion,
    this.disponible,
    this.codigo,
    this.dtm,
    this.denuncias,
  });

  String id;
  String descripcion;
  bool disponible;
  String codigo;
  String dtm;
  List<String> denuncias;

  factory Oficial.fromJson(Map<String, dynamic> json) => Oficial(
        id: json["_id"],
        descripcion: json["descripcion"],
        disponible: json["disponible"],
        codigo: json["codigo"],
        dtm: json["DTM"],
        denuncias: List<String>.from(json["denuncias"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "disponible": disponible,
        "codigo": codigo,
        "dtm": dtm,
        "denuncias": denuncias,
      };

  // String get imagenUrl {
  //   if (this.img == null) {
  //     return '$base_url/upload/oficials/no-image';
  //   } else if (this.img.contains('https')) {
  //     return this.img;
  //   } else if (this.img != null) {
  //     return '$base_url/upload/oficials/${this.img}';
  //   } else {
  //     return '$base_url/upload/oficials/no-image';
  //   }
  // }
}
