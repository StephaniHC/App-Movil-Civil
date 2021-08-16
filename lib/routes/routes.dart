import 'package:app_movil_civil/pages/denuncias/denucia_form_page.dart';
import 'package:app_movil_civil/pages/register_stepper_page.dart';
import 'package:app_movil_civil/pages/acceso_gps_page.dart';
import 'package:app_movil_civil/pages/loading_page1.dart';
import 'package:app_movil_civil/pages/mapa_page.dart';
import 'package:app_movil_civil/pages/ubicacion_page.dart';
import 'package:flutter/material.dart';

import 'package:app_movil_civil/pages/loading_page.dart';
import 'package:app_movil_civil/pages/login_page.dart';
import 'package:app_movil_civil/pages/home_page.dart';
import 'package:app_movil_civil/pages/welcome_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading': (BuildContext c) => LoadingPage(),
  'login': (BuildContext c) => LoginPage(),
  'home': (BuildContext c) => HomePage(),
  'welcome': (BuildContext c) => WelcomePage(),
  'register': (BuildContext c) => RegisterPage(),
  'denuncia_form': (BuildContext c) => DenunciaFormPage(),
  'ubicacion': (BuildContext c) => UbicacionPage(),
  'mapa': (_) => MapaPage(),
  'loading1': (_) => LoadingPage1(),
  'acceso_gps': (_) => AccesoGpsPage(),
};
