import 'package:flutter/material.dart';

class Themes{
  final lightTheme=ThemeData.light().copyWith(
    primaryColor: Color.fromARGB(255, 255, 96, 0),
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      textTheme: TextTheme(headline1: TextStyle(color:Colors.black))
    )
  );

  final darkTheme=ThemeData.dark().copyWith(
    
primaryTextTheme: TextTheme(headline1: TextStyle(color:Colors.white)),
buttonColor:Colors.blue[400],
accentIconTheme: IconThemeData(color:Colors.blue[400],),
accentColor: Colors.blue[400],
appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      textTheme: TextTheme(headline1: TextStyle(color:Colors.white))
    )
  );
}