import 'package:flutter/material.dart';

class ChipSectionWidget extends StatelessWidget {
  final title;
  final List<Widget> children;
  const ChipSectionWidget({Key key, this.title, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              this.title,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          Wrap(
              alignment: WrapAlignment.start,
              spacing: 6.0,
              runSpacing: 4.0,
              children: this.children),
        ],
      ),
    );
  }
}
