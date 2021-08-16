import 'package:app_movil_civil/bloc/busqueda/busqueda_bloc.dart';
import 'package:app_movil_civil/bloc/mapa/mapa_bloc.dart';
import 'package:app_movil_civil/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:app_movil_civil/routes/routes.dart';
import 'package:app_movil_civil/services/BottomNavigationBarServices/ui_provider.dart';
import 'package:app_movil_civil/services/auth_service.dart';
import 'package:app_movil_civil/theme/theme_service.dart';
import 'package:app_movil_civil/theme/themes.dart';
import 'package:app_movil_civil/services/denuncia_service.dart';
import 'package:app_movil_civil/services/denuncia_solicitud_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final notification = new NotificationsService();
    // notification.initNotifications();
    // notification.mensajesStream.listen((data) {
    //   // navigatorKey.currentState.pushNamed('welcome', arguments: data);
    //   print('recibiendo notification');
    //   print(data);
    //   // navigatorKey.currentState.pushNamed('login', arguments: data);

    //   navigatorKey.currentState.pushNamed('login');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthService()),
          ChangeNotifierProvider(create: (_) => DenunciaService()),
          ChangeNotifierProvider(create: (_) => DenunciaSolicitudService()),
          ChangeNotifierProvider(create: (_) => UiProvider()),
          BlocProvider(create: (_) => MiUbicacionBloc()),
          BlocProvider(create: (_) => MapaBloc()),
          BlocProvider(create: (_) => BusquedaBloc()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Denuncias Civil',
          navigatorKey: navigatorKey,
          // initialRoute: 'register_trabajador',
          initialRoute: 'loading1',
          routes: appRoutes,
          //theme: ThemeData(primaryColor: Color.fromARGB(255, 255, 96, 0)),
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          themeMode: ThemeService().getThemeMode(),
        ));
  }
}
