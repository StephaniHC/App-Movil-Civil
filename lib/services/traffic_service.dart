import 'package:app_movil_civil/models/traffic_response.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrafficService {
  // Singleton
  TrafficService._privateConstructor();
  static final TrafficService _instance = TrafficService._privateConstructor();
  factory TrafficService() {
    return _instance;
  }

  final _dio = new Dio();
  final String _baseUrl = 'https://api.mapbox.com/directions/v5';
  final String _apiKey =  'pk.eyJ1IjoiZnJhbmtsaW44NiIsImEiOiJja3M3a2YxZjIwYmxpMnZwZWVoY2dqdWl4In0.Jeoto_0fRX3RKe_64aH4vA';

  Future<DrivingResponse> getCoordsInicioYDestino(LatLng inicio, LatLng destino) async {
     
     final coordString = '${ inicio.longitude },${ inicio.latitude };${ destino.longitude },${ destino.latitude }';
     final url = '${ this._baseUrl }/mapbox/driving/$coordString';

     final resp = await this._dio.get( url, queryParameters: {
       'alternatives': 'true',
       'geometries': 'polyline6',
       'steps': 'false',
       'access_token': this._apiKey,
       'language': 'es',
     });

     final data = DrivingResponse.fromJson(resp.data);

     return data;
    //print(inicio);
    //print(destino);
  }
}
