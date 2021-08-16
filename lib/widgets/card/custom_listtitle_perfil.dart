import 'package:app_movil_civil/widgets/image_circle_widget.dart';
import 'package:flutter/material.dart';

class CustomListilePerfil extends StatelessWidget {
  final header;
  final title;
  final subtitle;
  final description;
  final img;
  final icon;

  const CustomListilePerfil(
      {Key key,
      @required this.header,
      @required this.description,
      @required this.title,
      @required this.subtitle,
      @required this.img,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4.0,
      margin: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          key: Key('padre'),
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text(this.header)),
            Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                key: Key('hijo 2'),
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.yellow,
                            margin: EdgeInsets.all(5),
                            width: 50,
                            height: 50,
                            alignment: Alignment.topLeft,
                            child: ImageCircleWidget(
                              key: Key('value'),
                              fotoUrl: img ?? "https://picsum.photos/200",
                              height: 50.0,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            this.title,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                          Row(
                            children: [
                              Text('CI: ${this.subtitle}',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 182, 183, 183),
                                      fontSize: 12),
                                  softWrap: true),
                              Icon(Icons.location_pin)
                            ],
                          )
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor)),
                          child: Text('Ver Perfil'),
                          onPressed: () => {},
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text("Descripcion:")),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 15),
              child: Text(this.description),
            ),
          ],
        ),
      ),
    );
  }
}
