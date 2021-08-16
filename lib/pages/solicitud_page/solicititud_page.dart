import 'package:animate_do/animate_do.dart';
import 'package:app_movil_civil/bloc/busqueda/busqueda_bloc.dart';
import 'package:app_movil_civil/bloc/mapa/mapa_bloc.dart';
import 'package:app_movil_civil/pages/denuncias/denucia_form_page.dart';
import 'package:app_movil_civil/pages/mapa_page.dart';
import 'package:app_movil_civil/pages/tapbar_page.dart';
import 'package:app_movil_civil/services/auth_service.dart';
import 'package:app_movil_civil/services/denuncia_service.dart';
import 'package:app_movil_civil/services/denuncia_solicitud_service.dart';
import 'package:app_movil_civil/widgets/card/custom_listtitle_perfil.dart';
import 'package:app_movil_civil/widgets/custom_listtitle.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistorialPage extends StatelessWidget {
  HistorialPage({Key key}) : super(key: key);
  final _mapamarcador = MapaPage();

  @override
  Widget build(BuildContext context) {
    final denunciaSolicitudService =
        Provider.of<DenunciaSolicitudService>(context, listen: false);
    final denunciaService =
        Provider.of<DenunciaService>(context, listen: false);
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: TapBarPage(tabs: [
          Tab(text: 'Pendiente'),
          Tab(text: 'Proceso')
        ], pages: [
          SingleChildScrollView(
              child: FutureBuilder(
            future: denunciaSolicitudService.getDenunciaPendiente(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data) {
                  return Column(
                    children: [
                      Container(
                          height: 300,
                          child: cardMapa(context,
                              denunciaSolicitudService.denuncia.coordenadas)),
                      CustomListilePerfil(
                          img: authService.usuario.img,
                          header: "Reportado por:",
                          title: authService.persona.nombre +
                              authService.persona.apellido,
                          subtitle: authService.persona.ci,
                          description:
                              denunciaSolicitudService.denuncia.descripcion),
                      Divider(
                        height: 15,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: Text('Respaldo Multimedia')),
                      Container(
                          height: 200,
                          child: listCard(context,
                              denunciaSolicitudService.denuncia.multimedia)),
                      Divider(),
                    ],
                  );
                } else {
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Center(
                          child: Text('No tienes denuncias pendientes')));
                }
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          )),
          SingleChildScrollView(
              child: FutureBuilder(
            future: denunciaService.getDenunciaEnProceso(authService.civil.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data) {
                  denunciaSolicitudService.limpiarDenuncia();
                  return Column(
                    children: [
                      Container(
                          height: 300,
                          child: cardMapa(
                              context, denunciaService.denuncia.coordenadas)),
                      CustomListilePerfil(
                          img: authService.usuario.img,
                          header: "Reportado por:",
                          title: authService.persona.nombre +
                              authService.persona.apellido,
                          subtitle: authService.persona.ci,
                          description:
                              denunciaService.denuncia?.descripcion ?? ''),
                      CustomListilePerfil(
                          img: denunciaService.usuario.img,
                          header: "Aceptado por:",
                          title: denunciaService.persona.nombre +
                              denunciaService.persona.apellido,
                          subtitle: denunciaService.persona.ci,
                          description: denunciaService.denuncia?.observacion ??
                              "Sin observacion aun"),
                      Divider(
                        height: 15,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: Text('Respaldo Multimedia')),
                      Container(
                          height: 200,
                          child: listCard(
                              context, denunciaService.denuncia.multimedia)),
                      Divider(),
                      //Boton aceptar Rechazar
                      // Container(
                      //     padding: EdgeInsets.all(10),
                      //     child: BotonPrincipal(
                      //         text: "Terminar",
                      //         onPressed: () async {
                      //           await terminarDenuncia(context);
                      //         })),
                    ],
                  );
                } else {
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Center(
                          child: Text('No tienes denuncias en proceso')));
                }
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          )),
        ]),
      ),
    );
  }

  Widget listCard(BuildContext context, List imagenes) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imagenes.length,
      itemBuilder: (context, idx) {
        return _card(imagenes[idx]);
      },
    );
  }

  _card(url) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: FadeInImage(
        width: 130,
        image: NetworkImage(url),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        height: 180.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget cardMapa(BuildContext context, String coodernadas) {
    centrar(context, coodernadas);
    Widget content = Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4.0,
        margin: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: GestureDetector(
                  onDoubleTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => _mapamarcador,
                    //     ));

                    // context.bloc<BusquedaBloc>().add(OnActivarMarcadorManual());
                    // final cameraUpdate = CameraUpdate.newLatLng(destino);

                    // context.bloc<MiUbicacionBloc>().state.ubicacion;
                  },
                  child: Stack(
                    children: [
                      _mapamarcador,
                      Center(
                        child: Transform.translate(
                            offset: Offset(0, -12),
                            child: BounceInDown(
                                from: 200,
                                child: Icon(Icons.location_on,
                                    size: 50, color: Colors.red))),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
    return content;
  }

  centrar(BuildContext context, String coodernadas) {
    var coordenadasString = coodernadas.split(',');
    LatLng destino = LatLng(
        double.parse(coordenadasString[0]), double.parse(coordenadasString[1]));
    CameraUpdate.newLatLng(destino);
  }
}
