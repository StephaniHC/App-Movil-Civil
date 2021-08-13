import 'dart:async';

//import 'package:app_movil_civil/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class UbicacionPage extends StatefulWidget {
  UbicacionPage({Key key}) : super(key: key);

  @override
  _UbicacionPageState createState() => _UbicacionPageState();
}

StreamSubscription<Position> positionStream;

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

StreamSocket streamSocket = StreamSocket();

class _UbicacionPageState extends State<UbicacionPage> {
  //SocketService socketService;

  final _geolocator = new Geolocator();

  final locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 100);
  @override
  void initState() {
    //this.socketService = Provider.of<SocketService>(context, listen: false);

    //this.socketService.connect();

    _geolocator.getPositionStream(locationOptions).listen((Position position) {
      if (position != null) {
      //  this.socketService.sendUbicacion(position.latitude, position.longitude);
      }
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());
    });

    // streamSocket.addResponse(this.socketService.escucharDenuncia());
    // this
    //     .socketService
    //     .socket
    //     .on('denuncia', (data) => {streamSocket.addResponse('d'), print(data)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicacion'),
      ),
      body: Container(
          child: StreamBuilder(
              stream: streamSocket.getResponse,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                return Container(child: Text(snapshot.data));
              })),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamSocket.dispose();

    super.dispose();
  }
}
