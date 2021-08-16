import 'dart:convert';

import 'package:app_movil_civil/global/environment.dart';
import 'package:app_movil_civil/models/denuncia.dart';
import 'package:app_movil_civil/models/denuncia_response.dart';
import 'package:app_movil_civil/models/foto.dart';
import 'package:app_movil_civil/models/oficial.dart';
import 'package:app_movil_civil/models/persona.dart';
import 'package:app_movil_civil/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class DenunciaSolicitudService with ChangeNotifier {
  String idDenuncia;
  Denuncia denuncia;
  Usuario usuario;
  Persona persona;
  Oficial oficial;

  final _storage = new FlutterSecureStorage();

  Future<bool> getDenunciaPendiente() async {
    var denunciastr = await this._storage.read(key: 'denuncia');
    if (this.idDenuncia == null) {
      if (denunciastr == null)
        return false;
      else
        this.idDenuncia = denunciastr;
    }

    final token = await this._storage.read(key: 'token');

    final resp = await http.get(
        '${Environment.apiUrl}/denuncias/${this.idDenuncia}',
        headers: {'Content-Type': 'application/json', 'x-token': token});

    if (resp.statusCode == 200) {
      var respData = json.decode(resp.body);
      this.denuncia = Denuncia.fromJson(respData['denuncia']);
      this.idDenuncia = this.denuncia.id;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> crearDenuncia(Denuncia denuncia) async {
    final token = await this._storage.read(key: 'token');

    final data = denunciaToJson(denuncia);

    final resp = await http.post('${Environment.apiUrl}/denuncias/',
        body: data,
        headers: {'Content-Type': 'application/json', 'x-token': token});
    if (resp.statusCode == 200) {
      // final respBody = jsonDecode(resp.body);
      var respData = json.decode(resp.body);
      this.denuncia = Denuncia.fromJson(respData['denuncia']);
      this.idDenuncia = this.denuncia.id;
      await _guardarDenuncia(idDenuncia);

      return true;
    } else {
      return false;
    }
  }

  Future<List<String>> uploadImage(List<Foto> filesPath) async {
    final url = Uri.parse('${Environment.apiUrl}/uploads/files');
    final uploadRequest = http.MultipartRequest('PUT', url);

    for (Foto filePath in filesPath) {
      var file =
          await http.MultipartFile.fromPath('imagen', filePath.value.path);
      uploadRequest.files.add(file);
      print('file path');
    }

    final streamResponse = await uploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode == 200) {
      final respBody = jsonDecode(resp.body);
      var multimedia = List<String>.from(respBody['url'].map((x) => x));
      return multimedia;
    }
    return [];
  }

  void limpiarDenuncia() async {
    this.idDenuncia = null;
    await deleteDenuncia();
  }

  Future _guardarDenuncia(String denuncia) async {
    return await _storage.write(key: 'denuncia', value: denuncia);
  }

  Future deleteDenuncia() async {
    await _storage.delete(key: 'denuncia');
  }
  // Aceptar denuncia
  // cambia en proceso a true
}
