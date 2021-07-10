import 'package:flutter/material.dart';

class TapBarPage extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> pages;
  const TapBarPage({Key key, @required this.tabs, @required this.pages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: double.maxFinite, child: tabbar(context)),
    );
  }

  Widget tabbar(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(
                unselectedLabelColor: Color.fromARGB(255, 124, 125, 126),
                labelColor: Color.fromARGB(255, 34, 50, 105),
                indicatorColor: Theme.of(context).primaryColor,
                tabs: this.tabs),
          ),
          Expanded(child: TabBarView(children: this.pages))
        ],
      ),
    );
  }
}
