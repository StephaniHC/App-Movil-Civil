import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionMultilineWidget extends StatelessWidget {
  final title;
  final description;
  const DescriptionMultilineWidget({Key key, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                this.title ?? "Descripcion",
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
                this.description ??
                    'Simplifying interfaces and experiences since 2012.  🎉 Feel free to contaSimplifying interfaces and experiences since 2012.',
                style: TextStyle(letterSpacing: 1),
                softWrap: true),
          ),
        ],
      ),
    );
  }
}
