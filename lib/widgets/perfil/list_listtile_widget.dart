import 'package:flutter/material.dart';

class DividerSectionWidget extends StatelessWidget {
  final title;
  final children;
  const DividerSectionWidget({Key key, this.title, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              this.title ?? "Informacion de usuario",
              //style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          this.children ?? Text('requiere una lista de ListTile')
        ],
      ),
    );
  }
}
