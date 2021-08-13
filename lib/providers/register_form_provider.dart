import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey= new GlobalKey<FormState>();

  String email='';
  String nombre='';
  String apellido='';
  String fechaNac='';
  String celular='';
  String direccion='';
  String password='';
  String confirmarPassword='';

bool isValidForm(){
  print(formKey.currentState?.validate());
  print("IMPRESIONESSSS");
return formKey.currentState?.validate() ?? false;
}



}


 
  
  
  