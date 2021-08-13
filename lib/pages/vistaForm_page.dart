import 'package:flutter/material.dart';
import 'package:app_movil_civil/helpers/validar.dart';

import 'package:app_movil_civil/widgets/form_field_input.dart';
//import 'package:app_movil_civil/widgets/image_form_input.dart';

// typedef SCallback = Function(Trabajador trabajador);

class VistaFormPage extends StatefulWidget {
  VistaFormPage({Key key}) : super(key: key);

  final bool validate = true;
  final formKey = GlobalKey<FormState>();
  // final PickedFile foto = Pick;

  static __VistaFormPageState of(BuildContext context) =>
      context.findAncestorStateOfType<__VistaFormPageState>();

  @override
  __VistaFormPageState createState() => __VistaFormPageState();
}

final emailCtrl = TextEditingController();
bool isvalidEmail = true;
final nombreCtrl = TextEditingController();
final apellidoCtrl = TextEditingController();
final celularCtrl = TextEditingController();
final direccionCtrl = TextEditingController();
final passCtrl = TextEditingController();
final pass2Ctrl = TextEditingController();

final validar = Validar();
// PickedFile foto;

class __VistaFormPageState extends State<VistaFormPage> {
  @override
  void dispose() {
    // RegisterTrabajadorPage.of(context).trabajador = trabajador;
    super.dispose();
    print('dispose');
  }

  @override
  void initState() {
    print('InitState');
    print(emailCtrl.text);
    print(nombreCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    // final authService = Provider.of<AuthService>(context);
   /* final trabajador = RegisterTrabajadorPage.of(context).trabajador;
    final userRegister = RegisterTrabajadorPage.of(context).userRegister;
    final foto = RegisterTrabajadorPage.of(context).foto;*/
    // final socketService = Provider.of<SocketService>(context);

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Column(
            children: [
              Container(
                child: Text('Registrate',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Agrega tus detalles para registrarte',
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 124, 125, 126)),
              )
            ],
          ),
          SizedBox(height: 20.0),
         
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: <Widget>[
                // Text(trabajador.nombre.toString()),
                SizedBox(height: 15),
                FormFieldInput(
                  keyboardType: TextInputType.emailAddress,
                  placeholder: "Email",
                  labelText: "Email",
                  textController: emailCtrl,
                  validator: (value) {
                    return validar.validarEmail(value, isvalidEmail);
                  },
                  onChanged: (value) async {
                  //  isvalidEmail = await validar.validarEmailService(value);
                   // trabajador.email = value;
                    print('isvalidEmail');
                   // print(trabajador.toJson());
                    setState(() {});
                  },
                ),
                SizedBox(height: 15),
                FormFieldInput(
                  placeholder: "Nombre",
                  labelText: "Nombre",
                  textController: nombreCtrl,
                  validator: (value) =>
                      validar.validarCampoRequerido(value, 'nombre'),
                  onChanged: (value) {
                    setState(() {});
                   // trabajador.nombre = value;
                    //print(trabajador.toJson());
                  },
                ),
                SizedBox(height: 15),
                FormFieldInput(
                  placeholder: "Apellido",
                  labelText: "Apellido",
                  textController: apellidoCtrl,
                  validator: (value) =>
                      validar.validarCampoRequerido(value, 'apellido'),
                  onChanged: (value) {
                    setState(() {});
                   // trabajador.apellido = value;
                    //print(trabajador.toJson());
                  },
                ),
                SizedBox(height: 15),
                FormFieldInput(
                  keyboardType: TextInputType.phone,
                  placeholder: "Celular",
                  labelText: "Celular",
                  textController: celularCtrl,
                  validator: (value) =>
                      validar.validarCampoRequerido(value, 'celular'),
                  onChanged: (value) {
                    setState(() {});
                    //trabajador.celular = value;
                   // print(trabajador.toJson());
                  },
                ),
                SizedBox(height: 15),
                FormFieldInput(
                  keyboardType: TextInputType.streetAddress,
                  placeholder: "Direccion",
                  labelText: "Direccion",
                  textController: direccionCtrl,
                  validator: (value) =>
                      validar.validarCampoRequerido(value, 'direccion'),
                  onChanged: (value) {
                    setState(() {});
                  
                  },
                ),
                SizedBox(height: 15),
                FormFieldInput(
                  isPassword: true,
                  placeholder: "Contraseña",
                  labelText: "Contraseña",
                  textController: passCtrl,
                  validator: (value) => validar.validarPassword(value),
                  onChanged: (value) {
                    setState(() {});
                    // user.pass = value;
               
                  },
                ),

                SizedBox(height: 20),
                FormFieldInput(
                  isPassword: true,
                  placeholder: "Contraseña",
                  labelText: "Contraseña",
                  textController: pass2Ctrl,
                  validator: (value) =>
                      validar.confirmarPassword(passCtrl.text, value),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
