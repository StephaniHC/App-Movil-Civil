import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final height;
  final Icon icon;
  final text;
  final icontext;

  const CustomCard({Key key, this.height, this.icon, this.text, this.icontext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.icontext,
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 124, 125, 126),
                ),
              ),
              SizedBox(
                width: 3,
              ),
              this.icon
            ],
          ),
          SizedBox(
            height: this.height * .1,
          ),
          Center(
            child: Text(this.text),
          )
        ]));
  }
}
