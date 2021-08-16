import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:app_movil_civil/bloc/busqueda/busqueda_bloc.dart';
import 'package:app_movil_civil/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:app_movil_civil/helpers/mostrar_alerta.dart';
import 'package:app_movil_civil/models/foto.dart';
import 'package:app_movil_civil/widgets/boton_principal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_movil_civil/bloc/mapa/mapa_bloc.dart';
import 'package:app_movil_civil/helpers/validar.dart';
import 'package:app_movil_civil/models/denuncia.dart';
import 'package:app_movil_civil/pages/mapa_page.dart';
import 'package:app_movil_civil/services/auth_service.dart';
import 'package:app_movil_civil/services/denuncia_service.dart';
import 'package:app_movil_civil/services/denuncia_solicitud_service.dart';
import 'package:app_movil_civil/widgets/form_field_input.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DenunciaFormPage extends StatelessWidget {
  DenunciaFormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creando Denuncia"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [_Form()],
      )),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

List<String> tipodenuncias = [
  "Accidente de transito",
  "Infraccion vehicular",
  "Denuncia preventiva",
  "Congestion vehicular"
];

var denunciasOK = [false, false, false, false];
var icon = [false, false, false, false];

final denuncia = Denuncia();
final emailCtrl = TextEditingController();
final passCtrl = TextEditingController();
final formKey = GlobalKey<FormState>();
final _mapamarcador = MapaPage();
List<Foto> multimedia = [];

class __FormState extends State<_Form> {
  // Foto foto = Foto();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Tipo de denuncia',
                style: TextStyle(color: Color.fromARGB(255, 124, 125, 126)),
              ),
            ),
            Container(
              child: Column(
                children: tipodenuncias
                    .asMap()
                    .map((i, tipo) => MapEntry(
                          i,
                          CheckboxListTile(
                              title: Text(tipo),
                              value: denunciasOK[i],
                              onChanged: (value) {
                                print(tipo);

                                denunciasOK = [false, false, false, false];
                                denunciasOK[i] = value;
                                if (value == true)
                                  denuncia?.tipoDenuncia = tipo;
                                print(denuncia.tipoDenuncia);
                                setState(() {});
                              }),
                        ))
                    .values
                    .toList(),
              ),
            ),
            Divider(height: 30),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Direccion de denuncia',
                          style: TextStyle(
                              color: Color.fromARGB(255, 124, 125, 126)),
                        ),
                        Expanded(child: SizedBox()),
                        Text(
                          '+ Ubicacion',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(height: 200, child: cardMapa(context)),
            Divider(height: 25),
            Container(
              child: Row(
                children: [
                  Text(
                    'Respaldo multimedia',
                    style: TextStyle(color: Color.fromARGB(255, 124, 125, 126)),
                  ),
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () async {
                      await _seleccionarFoto(context).then((value) {
                        setState(() {});
                      });
                      setState(() {});
                    },
                    child: Text(
                      '+ Agregar foto',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
                height: 200,
                alignment: Alignment.centerLeft,
                child: listCard(context, multimedia)),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              // alignment: Alignment.bottomRight,

              child: Row(
                children: [
                  Text(
                    'Detalle/ Observacion',
                    style: TextStyle(color: Color.fromARGB(255, 124, 125, 126)),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    '+ Agregar Nota',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            FormFieldInput(
              validator: (value) {
                return Validar().validarCampoRequerido(value, "Observacion");
              },
              onChanged: (value) {
                denuncia.descripcion = value;
              },
              placeholder: '...',
              labelText: 'Observacion',
              textController: passCtrl,
            ),
            SizedBox(height: 20),
            BotonPrincipal(
                text: "Enviar",
                onPressed: () async {
                  enviarDenuncia();
                }),
          ],
        ),
      ),
    );
  }

  enviarDenuncia() async {
    final formValidate = formKey.currentState.validate();

    if (!formValidate) return null;

    final authService = Provider.of<AuthService>(context, listen: false);
    final denunciaSolicitudService =
        Provider.of<DenunciaSolicitudService>(context, listen: false);

    denuncia.coordenadas = obtenerCoordenadas();

    denuncia.multimedia =
        await denunciaSolicitudService.uploadImage(multimedia);

    denuncia.civil = authService.civil.id;

    final issaved = await denunciaSolicitudService.crearDenuncia(denuncia);

    if (issaved) {
      //   notificacion.guardarTokenFCMServices();
      // mostrarAlerta(context, 'Denuncia Enviada',
      //     'Tu denuncia ha sido notificada, un oficial llegara pronto');
      Navigator.pop(context);
      // Navigator.pus(
      //     context, 'home');
    } else {
      mostrarAlerta(context, 'Denuncia no enviada',
          'Tu denuncia no ha sido enviada, verifica la los campos requeridos');
    }
  }

  Widget cardMapa(BuildContext context) {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _mapamarcador,
                        ));

                    context.bloc<BusquedaBloc>().add(OnActivarMarcadorManual());
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
                                child: Icon(
                                  Icons.location_on,
                                  size: 50,
                                  color: Colors.red,
                                ))),
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

  String obtenerCoordenadas() {
    final mapaBloc = context.bloc<MapaBloc>();

    double lat = mapaBloc.state?.ubicacionCentral?.latitude ??
        context.bloc<MiUbicacionBloc>().state.ubicacion.latitude;
    double lon = mapaBloc.state?.ubicacionCentral?.longitude ??
        context.bloc<MiUbicacionBloc>().state.ubicacion.longitude;
    return '$lat,$lon';
  }

  Widget listCard(BuildContext context, List<Foto> imagenes) {
    if (imagenes.length == 0) {
      return _card2();
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imagenes.length,
      itemBuilder: (context, idx) {
        return _card(imagenes[idx]);
      },
    );
  }

  _card2() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: FadeInImage(
        width: 130,
        image: AssetImage('assets/placeholder.png'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        height: 180.0,
        fit: BoxFit.cover,
      ),
    );
  }

  _card(Foto foto) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: FadeInImage(
        width: 100,
        image: FileImage(File(foto.value.path)),
        // image: NetworkImage(url),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
        height: 180.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Future _seleccionarFoto(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              BotonPrincipal(
                  text: "ACTIVAR CAMARA",
                  onPressed: () async {
                    await _procesarImagen(ImageSource.camera).then((value) {
                      if (value != null) {
                        Foto(value: value);
                        multimedia.add(Foto(value: value));
                        // state.didChange(value);
                      }
                    });
                    Navigator.pop(context);
                    print('poped');
                  }),
              SizedBox(
                height: 10,
              ),
              BotonPrincipal(
                  text: "ABRIR GALERIA",
                  onPressed: () async {
                    await _procesarImagen(ImageSource.gallery).then((value) {
                      if (value != null) {
                        multimedia.add(Foto(value: value));

                        // state.didChange(value);
                      }
                    });
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
        actions: [
          FlatButton(
              onPressed: () => Navigator.pop(context), child: Text('Cerrar')),
        ],
      ),
    );
  }

  Future<PickedFile> _procesarImagen(ImageSource origen) async {
    final ImagePicker _picker = ImagePicker();

    PickedFile foto = await _picker.getImage(source: origen);
    if (foto == null) {
      print('foto nula');
    } else {
      print('foto cargada');
    }
    setState(() {});
    return foto;
  }
}
