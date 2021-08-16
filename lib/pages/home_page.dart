import 'package:app_movil_civil/pages/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_movil_civil/pages/perfil_user_page.dart';
import 'package:app_movil_civil/pages/solicitud_page/solicititud_page.dart';
import 'package:app_movil_civil/services/BottomNavigationBarServices/ui_provider.dart';
import 'package:app_movil_civil/services/auth_service.dart';
import 'package:app_movil_civil/widgets/BottomNavigationBarWidget/custom_navigatorbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    // final notificacion =
    // Provider.of<NotificationsService>(context, listen: false);
    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(), body: _HomePageBody());
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvider
    // final scanListProvider =
    //     Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        // scanListProvider.cargarScanPorTipo('geo');
        return Container(
          child: Center(child: Text('TAP 0')),
        ); //MapasPage();

      case 1:
        // // scanListProvider.cargarScanPorTipo('http');
        // final authService = Provider.of<AuthService>(context);
        // // final notificacion =
        // // Provider.of<NotificationsService>(context, listen: false);
        // return Container(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       RaisedButton(
        //         child: Text('Logout'),
        //         onPressed: () async {
        //           // await notificacion.borrarTokenFCMServices();
        //           authService.logout();
        //           Navigator.pushReplacementNamed(context, 'login');
        //         },
        //       ),
        //       Text('Logeado')
        //     ],
        //   ),
        // ); //DireccionesPage();
        return SettingPage();
      case 2:
        return PerfilUserPage();
      case 3:
        return HistorialPage();
      default:
        return Container(
          child: Text('TAP 0 Default'),
        );
    }
  }
}
