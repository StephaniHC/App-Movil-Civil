
import 'package:app_movil_civil/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingPage extends StatefulWidget {  

  @override
  _SettingPageState createState() => _SettingPageState();
}



class _SettingPageState extends State<SettingPage> {
String _status="Deshabilitado";
bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Ajustes"),),
      body: Center(
        child:Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              "Ajustes Visuales",
              //style: TextStyle(color:Colors.blue[400],),
            ),
          ),

          SizedBox(height:8.0),
          Divider(),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Modo Oscuro",
              style: TextStyle(color:Colors.blue[400],),
            ),
          ),
           SizedBox(height: 10.0,),
          Row(children: <Widget>[
            Text(this._status),
           // SizedBox(width: MediaQuery.of(context).size.height * .25,),
            _swicht()
            
          ],),



         // Text('requiere una lista de ListTile')
        ],
      ),
      
       ),
       
    ),
      
    );
  }


  Widget _swicht() {
  return Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                if(isSwitched){
                   Get.changeThemeMode(ThemeMode.dark);
                   setState(() {
                     _status="Habilitado";
                   });
                    
                }else{
                    Get.changeThemeMode(ThemeMode.light);
                    setState(() {
                      _status="Deshabilitado";
                    });
                }
    
              });
            },
            activeTrackColor: Colors.grey,
            activeColor: Colors.blue[400],
          );
}


}

