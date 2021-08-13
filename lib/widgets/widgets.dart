import 'package:animate_do/animate_do.dart';

import 'package:app_movil_civil/bloc/busqueda/busqueda_bloc.dart';
import 'package:app_movil_civil/helpers/helpers.dart';
import 'package:app_movil_civil/models/search_result.dart';
import 'package:app_movil_civil/search/search_destination.dart';
import 'package:app_movil_civil/services/traffic_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polyline/polyline.dart' as Poly;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_movil_civil/bloc/mapa/mapa_bloc.dart';

import 'package:app_movil_civil/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';

part 'btn_ubicacion.dart';
part 'btn_mi_ruta.dart';
part 'btn_seguir_ubicacion.dart';
part 'searchbar.dart';
part 'marcador_manual.dart';