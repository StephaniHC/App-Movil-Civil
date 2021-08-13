import 'package:app_movil_civil/routes/routes.dart';
import 'package:app_movil_civil/services/BottomNavigationBarServices/ui_provider.dart';
import 'package:app_movil_civil/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          ChangeNotifierProvider(create: (_) => UiProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Denuncias Civil',
          navigatorKey: navigatorKey,
          // initialRoute: 'register_trabajador',
          initialRoute: 'welcome',
          routes: appRoutes,
          theme: ThemeData(primaryColor: Color.fromARGB(255, 255, 96, 0)),
        ));
  }
}
