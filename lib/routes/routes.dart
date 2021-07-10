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
};
