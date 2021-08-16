import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ThemeService{


final _storage = new FlutterSecureStorage();


ThemeMode getThemeMode(){

   if( isSavedDarkMode()=="true"){
      return ThemeMode.dark;
   }else{
    return  ThemeMode.light;
   }
 
}


Future isSavedDarkMode()async{
  return await _storage.read(key: "dark");
  
}


void saveThemeMode(String isDarkMode)async{
  await _storage.write(key: "dark", value: isDarkMode);
//getStorage.write(storageKey, isDarkMode);
}

void changeThemeMode()async{

print("TESTTT");
  
  print(_storage.read(key: "dark"));
 


  if(await isSavedDarkMode()=="true"){
     Get.changeThemeMode(ThemeMode.light);
     saveThemeMode("false");
  }else{
  Get.changeThemeMode(ThemeMode.dark);
  saveThemeMode("true");
  }
  

}

}