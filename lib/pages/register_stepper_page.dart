import 'dart:convert';
import 'dart:io';

import 'package:app_movil_civil/global/environment.dart';
import 'package:app_movil_civil/helpers/mostrar_alerta.dart';
import 'package:app_movil_civil/providers/register_form_provider.dart';
import 'package:app_movil_civil/services/auth_service.dart';
import 'package:app_movil_civil/widgets/form_field_input.dart';
import 'package:flutter/material.dart';
import 'package:app_movil_civil/helpers/validar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  //const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
int _currentStep = 0;
final nameController = TextEditingController();
final surnameController = TextEditingController();
final emailController=TextEditingController();
final phoneController=TextEditingController();
final adressController=TextEditingController();
final ciController=TextEditingController();
final passwordController=TextEditingController();
final passwordConfiController=TextEditingController();
final dateController=TextEditingController();
final formKey = GlobalKey<FormState>();
File _picture;
File _pictureCard;
File _gesturePicture;
bool _loading=false;
int _validarcarnet=1;
int _validarGesture=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Registrarse'),
      ),
      body: Stepper(
         controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, 
          VoidCallback onStepCancel}) {
     // return _nextSubmit();
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Theme.of(context).primaryColor,
              child: TextButton(
              onPressed: (){
              _nextSubmit(context,onStepContinue);
              },
              child: const Text('Siguiente', style: TextStyle(color:Colors.white),),
            ), 
              onPressed: (){}
              ),
             
           
          ],
        );

      },
        steps: _mySteps(),

        currentStep: this._currentStep,
        onStepTapped: (step){
          // setState(() {
             
          //   this._currentStep = step;
          // });
        },
        onStepContinue: (){

          setState(() {
            if(this._currentStep < this._mySteps().length - 1 ){
                  this._currentStep = this._currentStep + 1;          
            }
            
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep > 0) {
              this._currentStep = this._currentStep - 1;
            } else {
              this._currentStep = 0;
            }
          });
        },
      ),
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('Datos Personales'),
        content: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 70.0,
              child: ClipOval(
                  child: SizedBox(
                width: 180.0,
                height: 180.0,
                child: (_picture != null)
                    ? Image.file(_picture, fit: BoxFit.fill)
                    : Image.network(
                        "https://www.pngkey.com/png/full/52-522921_kathrine-vangen-profile-pic-empty-png.png",
                        fit: BoxFit.fill,
                      ),
              )),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.camera,
                size: 30.0,
              ),
              onPressed: () async {
                final picker = new ImagePicker();

                final PickedFile pickedFile =
                    await picker.getImage(source: ImageSource.camera);

                if (pickedFile != null) {
                  setState(() {
                      _picture=File.fromUri(Uri(path:pickedFile.path)); 
                       _uploadImage(context,pickedFile.path);       
                 });
                    }

                },
              ),
          _loginForm(context),
          SizedBox(height:5.0),
          _progressIndicator(),
        SizedBox(height:5.0),
              ],
        ),   
        isActive: _currentStep >= 0 ,
      ),
      Step(
        title: Text('Subir Foto Carnet'),
        content: _imageCard(context),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Analisis de Gestos'),
        content: _analisisGestos(context),
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }

  Widget _loginForm(
    BuildContext context,
  ) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children:[
            //EMAIL
            FormFieldInput( 
                  suffixIcon: Icon(Icons.alternate_email),
                  validator: (value) {
                    return Validar().validarEmail(value, true);
                  },
                  onChanged: null,
                  placeholder: 'Email',
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  textController: emailController,
                ),
                 SizedBox(height:10.0),
                //NOMBRES
            FormFieldInput(
                  suffixIcon: Icon(Icons.person),
                  placeholder: 'Nombres',
                  labelText: 'Nombres',
                  onChanged: null,
                  textController: nameController,
                  validator: (value) {
                return Validar().validarCampoRequerido(value, 'Nombres');
              },
          ),
           SizedBox(height:10.0),
              //APELLIDOS
            FormFieldInput(
              suffixIcon: Icon(Icons.person_outline),
                placeholder: 'Apellidos',
                labelText: 'Apellidos',
                onChanged: null,
                textController: surnameController,
                validator: (value) {
                  return Validar().validarCampoRequerido(value, 'Apellidos');
                },
              ),
              SizedBox(height: 10.0),
              //FECHA DE NACIMIENTO
              FormFieldInput(
                suffixIcon: Icon(Icons.calendar_today_sharp),
                placeholder: 'Fecha de Nacimiento',
                labelText: 'Fecha de Nacimiento',
                keyboardType: TextInputType.datetime,
                onChanged: null,
                textController: dateController,
                validator: (value) {
                  return Validar()
                      .validarCampoRequerido(value, 'Fecha de nacimiento');
                },
              ),
              SizedBox(height: 10.0),
              //TELEFONO
            FormFieldInput(
              suffixIcon: Icon(Icons.phone),
              validator: (value) {
                return Validar().validarTelefono(value);
              },
                    onChanged: null,
                    placeholder: 'Telefono',
                    labelText: 'Telefono',
                    keyboardType: TextInputType.number,
                    textController: phoneController,
            ),
             SizedBox(height:10.0),
              //DIRECCION
              FormFieldInput(
                suffixIcon: Icon(Icons.map_outlined),
                placeholder: 'Direccion',
                labelText: 'Direccion',
                onChanged: null,
                textController: adressController,
                validator: (value) {
                  return Validar().validarCampoRequerido(value, 'Direccion');
                },
              ),
              SizedBox(height: 10.0),
              //CONTRASENA
             FormFieldInput(
               suffixIcon: Icon(Icons.lock),
              validator: (value) {
                return Validar().validarPassword(value);
              },
                    onChanged: null,
                    placeholder: 'Contraseña',
                    labelText: 'Contraseña',
                    textController: passwordController,
                    isPassword: true,
            ), 
             SizedBox(height:10.0),
              //CONFIRMAR CONTRASENA
            FormFieldInput(
              suffixIcon: Icon(Icons.lock_outline),
              validator: (value) {
                return Validar().confirmarPassword(passwordConfiController.text,passwordController.text);
              },
                    onChanged: null,
                    placeholder: 'Confirmar Contraseña',
                    labelText: 'Confirmar Contraseña',
                    textController: passwordConfiController,
                    isPassword: true,
            ), 
            
            
          ],
          
          
        )
        ),
   );

  }

 _nextSubmit(context,VoidCallback onStepContinue)async {
   final authService = Provider.of<AuthService>(context, listen:false);

if(_currentStep==0){
                     
if(!formKey.currentState.validate() || _picture==null){
  mostrarAlerta(context, 'Fallo en el registro',
        'Debe completar los campos requeridos para continuar');
}else{
  final registerOk= await authService.register(
  emailController.text.trim(),
  passwordController.text.trim(),
   nameController.text.trim(), 
   surnameController.text.trim(), 
   phoneController.text.trim(),
    adressController.text.trim(), 
    ciController.text.trim(), 
    dateController.text.trim(), 
    ); 

    if (registerOk == "true" ) {
      //ADD imageKey to collection and Create collection
          setState(() {
            _loading=true;
          });
      final uploadImageToCollection= await authService.uploadImage(
        authService.usuario.uid,
        authService.imageKey);

      if(uploadImageToCollection== "true"){
        setState(() {
        _loading=false;
        onStepContinue();
      });
      
   }else{
     mostrarAlerta(context, 'Fallo en el registro',
        'Error en la subida de imagen');
         setState(() {
    _loading=false;
  });
   }

  } else {
   
       mostrarAlerta(context, 'Fallo en el registro',
       registerOk);
        setState(() {
    _loading=false;
    });

 }

}
}//END  STEP 0



if(_currentStep==1){

  setState(() {
    _validarcarnet++;
  });
  

if(_validarcarnet>2 && _pictureCard==null){
      mostrarAlerta(context, 'Fallo en la verificacion',
              'Tiene que subir la foto de su carnet para continuar');
}

  if(_pictureCard!=null){

 final verifyCard= await authService.verifyCard(authService.usuario.uid, authService.carnetKey);
 setState(() {
   _loading=true;
 });
  if(verifyCard=="true"){
    mostrarAlerta(context, 'Verificacion exitosa',
       "Tomese una selfie con los ojos cerrados y sonriendo");
        setState(() {
          _loading=false;
        });

         final uploadIMtoUser=await authService.addImageToUser(
           authService.usuario.uid, 
           authService.imageKey
           );

        if(uploadIMtoUser=="true"){
            onStepContinue();
        }else{
          mostrarAlerta(context, 'Algo salio mal',
         uploadIMtoUser);
        }
        
       
       
  }else{
    setState(() {
          _loading=false;
        });
     mostrarAlerta(context, 'Fallo en la verificacion',
       "Intente nuevamente");
    
  }

  }else{
    if(_pictureCard!=null){
      mostrarAlerta(context, 'Fallo en la verificacion',
       'Suba su foto de carnet para poder avanzar');
    }
  
  }
  
  
}
if(_currentStep==2){

   setState(() {
    _validarGesture++;
  });

  if(_validarGesture>2 && _gesturePicture==null){
      mostrarAlerta(context, 'Fallo en la verificacion',
              'Tiene que subir una foto para continuar');
}

  if(_gesturePicture!=null){
    
 final verifyGesture= await authService.verifyGesture(authService.gestureKey);
  if(verifyGesture=="true"){
     
      if (Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Registro exitoso"),
              content: Text("Ingrese para continuar"),
              actions: <Widget>[
                MaterialButton(
                    child: Text('Ok'),
                    elevation: 5,
                    textColor: Colors.blue,
                    onPressed: ()=> Navigator.pushNamedAndRemoveUntil(
                           context, 'login', (Route<dynamic> route) => false)
                 ) ]
            )
            );
  }

             onStepContinue();
          
  }else{
     mostrarAlerta(context, 'Fallo en la verificacion',
      "La verificacion falló! intente nuevamente");    
       }
  }



}




  }






Future _uploadImage(BuildContext context, String filepath) async {

  final authService = Provider.of<AuthService>(context, listen:false);
  final url= Uri.parse('${Environment.apiUrl}/upload/60bb84fc89df2dce8c758bfc/1');
  final uploadRequest=http.MultipartRequest('POST', url );
  final file=await http.MultipartFile.fromPath('file0', filepath);
  uploadRequest.files.add(file);

  final streamResponse=await uploadRequest.send();
  final resp= await http.Response.fromStream(streamResponse);
  
  if(resp.statusCode == 200){
  final respBody = jsonDecode(resp.body);
  if(_pictureCard!=null && _currentStep==1){
   
    authService.carnetKey=respBody['key'];
    authService.carnetURL=respBody['url'];
   
  }else{
  if(_picture!=null && _currentStep==0){
    authService.imageKey=respBody['key'];
    authService.imageUrl=respBody['url'];
    
    }else{
      if(_gesturePicture!=null && _currentStep==2){
    authService.gestureKey=respBody['key'];
    authService.gestureURL=respBody['url'];
 } 
    }
  }  
 
  
  
  
  }  
}






Widget _imageCard(BuildContext context) {
   
  return Column(
    children: [
      Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child:SizedBox(
            width: 250.0,
            height: 210.0,
            child: (_picture != null)
                ? Image.file(_picture, fit: BoxFit.fill)
                : Image.network(
                    "https://www.pngkey.com/png/full/52-522921_kathrine-vangen-profile-pic-empty-png.png",
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        SizedBox(height: 15.0),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: 250.0,
            height: 210.0,
            child: (_pictureCard != null)
                ? Image.file(_pictureCard, fit: BoxFit.fill)
                : Image.network(
                    "https://image.flaticon.com/icons/png/512/455/455593.png",
                    fit: BoxFit.fill),
          ),
        ),
        IconButton(
                icon:Icon( 
                  FontAwesomeIcons.camera,
                  size: 30.0,
                ),
                onPressed: () async{

                 final picker=new ImagePicker();
                 final PickedFile  pickedFile= await picker.getImage(
                   source: ImageSource.camera
                   ); 

                  if(pickedFile!=null){
                  setState(() {
                      _pictureCard=File.fromUri(Uri(path:pickedFile.path)); 
                       _uploadImage(context,pickedFile.path);       
                 });
                    }

                },
              ),
        SizedBox(height: 5.0),
        _progressIndicator(),
                
    ],
  );
}



Widget _analisisGestos(BuildContext context){
return Column(
    children: [
        Text("Tomese un selfie con los ojos cerrados y con una sonrisa :)",textAlign: TextAlign.center),
        SizedBox(height:25.0),
       Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child:SizedBox(
            width: 300.0,
            height: 300.0,
            child: (_gesturePicture != null)
                ? Image.file(_gesturePicture, fit: BoxFit.fill)
                : Image.network(
                    "https://www.pngkey.com/png/full/52-522921_kathrine-vangen-profile-pic-empty-png.png",
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.camera,
            size: 30.0,
          ),
          onPressed: () async {
            final picker = new ImagePicker();

            final PickedFile pickedFile =
                await picker.getImage(source: ImageSource.camera);

            if (pickedFile != null) {
              setState(() {
                _gesturePicture = File.fromUri(Uri(path: pickedFile.path));
                _uploadImage(context, pickedFile.path);
              });
            }
          },
        ),
        SizedBox(height: 5.0),
                
    ],
  );
}

 Widget _progressIndicator() {

   return _loading? CircularProgressIndicator(
            color:Colors.red
          ):
          Container();
 }

}
