class Validar {
  String validarEmail(String email, [valido = true]) {
    if (valido) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if (regExp.hasMatch(email)) {
        return null;
      } else {
        return 'Email no es correcto';
      }
    } else {
      return 'Email ya existe';
    }
  }

  // Future validarEmailService(String email) async {
  //   print('validaEmailServices---');
  //   if (email.length < 5 || this.validarEmail(email) != null) {
  //     return true;
  //   }
  //   var empleadorServices = EmpleadorService();
  //   bool res = await empleadorServices.validarEmail(email);

  //   return res;
  // }

  String validarPassword(String password) {
    final mincaracteres = 6;
    if (password.length >= mincaracteres) {
      return null;
    } else {
      return 'Deber tener más de $mincaracteres caracteres';
    }
  }

  String confirmarPassword(String password, String password2) {
    if (password == password2) {
      return null;
    } else {
      return 'La contraseña no coincide';
    }
  }

  String validarAvatar(String value) {
    if (value == null) {
      return "El perfil de usuario es obligatorio";
    }
    return null;
  }

  String validarCampoRequerido(String value, String nombreCampo) {
    if (value.length < 1) {
      return "Campo $nombreCampo es obligatorio *";
    }
    return null;
  }
   String validarTelefono(String phone) {
    final mincaracteres = 6;
    if (phone.length >= mincaracteres) {
      return null;
    } else {
      return 'Deber tener más de $mincaracteres caracteres';
    }
  }
}
