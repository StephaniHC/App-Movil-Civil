import 'dart:convert';

import 'package:app_movil_civil/global/environment.dart';
import 'package:app_movil_civil/models/civil.dart';
import 'package:app_movil_civil/models/denuncia.dart';
import 'package:app_movil_civil/models/denuncia_response.dart';
import 'package:app_movil_civil/models/oficial.dart';
import 'package:app_movil_civil/models/persona.dart';
import 'package:app_movil_civil/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class DenunciaService with ChangeNotifier {
  bool enProceso = false;
  String idDenuncia;
  Denuncia denuncia;
  Usuario usuario;
  Persona persona;
  Oficial oficial;

  final _storage = new FlutterSecureStorage();

  // Aceptar denuncia

  // Aceptar denuncia

  Future<bool> getDenunciaEnProceso(String idCivil) async {
    final token = await this._storage.read(key: 'token');

    final data = {'civil': idCivil};

    final resp = await http.post('${Environment.apiUrl}/denuncias/procesocivil',
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json', 'x-token': token});

    if (resp.statusCode == 200) {
      final denunciaResponse = denunciaResponseFromJson(resp.body);
      this.denuncia = denunciaResponse.denuncia;
      this.usuario = denunciaResponse.usuario;
      this.persona = denunciaResponse.persona;
      this.oficial = denunciaResponse.oficial;
      this.idDenuncia = this.denuncia.id;

      this.enProceso = true;
      return true;
    } else {
      return false;
    }
  }

  // cambia en proceso a true
}
