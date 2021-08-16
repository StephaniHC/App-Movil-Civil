import 'dart:convert';

Denuncia denunciaFromJson(String str) => Denuncia.fromJson(json.decode(str));

String denunciaToJson(Denuncia data) => json.encode(data.toJson());

class Denuncia {
  Denuncia({
    this.id,
    this.multimedia,
    this.coordenadas,
    this.fecha,
    this.observacion,
    this.estado,
    this.calificacion,
    this.descripcion,
    this.civil,
    this.oficial,
    this.tipoDenuncia,
  });

  String id;
  List<String> multimedia;
  String coordenadas;
  String fecha;
  String observacion;
  String estado;
  String calificacion;
  String descripcion;
  String tipoDenuncia;
  String civil;
  String oficial;

  factory Denuncia.fromJson(Map<String, dynamic> json) => Denuncia(
        id: json["_id"],
        multimedia: List<String>.from(json["multimedia"].map((x) => x)),
        coordenadas: json["coordenadas"],
        fecha: json["createdAt"],
        observacion: json["observacion"],
        estado: json["estado"],
        calificacion: json["calificacion"],
        descripcion: json["descripcion"],
        civil: json["civil"],
        oficial: json["oficial"],
        tipoDenuncia: json["tipo_denuncia"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "multimedia": multimedia,
        "coordenadas": coordenadas,
        "fecha": fecha,
        "observacion": observacion,
        "estado": estado,
        "calificacion": calificacion,
        "descripcion": descripcion,
        "civil": civil,
        "oficial": oficial,
        "tipo_denuncia": tipoDenuncia,
      };
}
