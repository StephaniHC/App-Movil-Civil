import 'package:app_movil_civil/services/BottomNavigationBarServices/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.crop_square_outlined), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Solicitudes'),
      ],
    );
  }
}
