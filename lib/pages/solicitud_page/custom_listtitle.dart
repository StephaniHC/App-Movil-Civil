import 'package:app_movil_civil/widgets/SliverAppBar/image_circle_widget.dart';
import 'package:app_movil_civil/widgets/custom_chip.dart';
import 'package:flutter/material.dart';

class CustomListile extends StatelessWidget {
  final title;
  final subtitle;
  final icon;

  const CustomListile({Key key, this.title, this.subtitle, this.icon})
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
                            alignment: Alignment.topLeft,
                            child: ImageCircleWidget(
                              key: Key('value'),
                              fotoUrl: "https://picsum.photos/200",
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
                            'Luis Enrique Perez',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                          Row(
                            children: [
                              Text('Santa Cruz de la sierra ',
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
                      flex: 2,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text('12-Nov-20',
                            style: TextStyle(
                                color: Color.fromARGB(255, 182, 183, 183),
                                fontSize: 12),
                            softWrap: true),
                      ))
                ],
              ),
            ),
            SizedBox(height: 5),
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
                          CustomChip(
                            label: 'Limpieza',
                            textcolor: Colors.white,
                            color: Color.fromARGB(255, 32, 217, 148),
                            scale: .8,
                            fontSize: 12.0,
                          ),
                          CustomChip(
                            // key: Key('dw'),
                            label: '15-05-20',
                            textcolor: Color.fromARGB(255, 182, 183, 183),
                            color: Colors.transparent,
                            scale: .8,
                            fontSize: 10.0,
                          )
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Text('Co dsa das das dasd das dasdmentario',
                          style: TextStyle(
                              color: Color.fromARGB(255, 182, 183, 183),
                              fontSize: 15),
                          softWrap: true)),
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: CustomChip(
                          key: Key('value'),
                          label: '4.0',
                          textcolor: Colors.white,
                          color: Color.fromARGB(255, 32, 217, 148),
                        ),
                      ))
                ],
              ),
            ),
            Divider(
              // color: Colors.black,
              height: 20,
            ),
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
                          CustomChip(
                            key: Key('d'),
                            label: 'Limpieza',
                            textcolor: Colors.white,
                            color: Color.fromARGB(255, 32, 217, 148),
                            scale: .8,
                            fontSize: 12.0,
                          ),
                          CustomChip(
                            // key: Key('dw'),
                            label: '15-05-20',
                            textcolor: Color.fromARGB(255, 182, 183, 183),
                            color: Colors.transparent,
                            scale: .8,
                            fontSize: 10.0,
                          )
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Text('Co dsa das das dasd das dasdmentario',
                          style: TextStyle(
                              color: Color.fromARGB(255, 182, 183, 183),
                              fontSize: 13),
                          softWrap: true)),
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: CustomChip(
                          key: Key('value'),
                          label: '4.0',
                          textcolor: Colors.white,
                          color: Color.fromARGB(255, 32, 217, 148),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
