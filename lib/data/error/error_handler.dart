const unknownError = 999;
// Login error
const loginUsernameError = 1001;
const passwordLoginError = 1002;
const loginCredentialsError = 1003;
// Forgot password error
const mailNotRegisteredError = 1004;
const invalidTokenError = 1006;
// Register error
const registerUsernameError = 2001;
const registerPasswordError = 2002;
const registerDniError = 2006;
const registerMailError = 2005;
const registerObligatoryError = 2003;
const noMatchingIdError = 2009;
// Event errors
const noEventCodeError = 4007;
const wrongAccessCodeError = 4008;
// Auth errors
const invalidAuthTokenError = 401;

class BoxtingException implements Exception {
  final int? statusCode;
  late String message;
  BoxtingException({required this.statusCode}) {
    switch (statusCode) {
      case unknownError:
        message = 'Ocurrió un error desconocido';
        break;
      case loginUsernameError:
        message = 'El usuario o contraseña ingresado es incorrecto';
        break;
      case passwordLoginError:
        message = 'El usuario o contraseña ingresado es incorrecto';
        break;
      case loginCredentialsError:
        message =
            'Las credenciales de acceso utilizadas no pertenecen al login / El rol no tiene permiso para iniciar sesión con esa ruta';
        break;
      case registerUsernameError:
        message = 'El nombre de usuario ingresado ya existe';
        break;
      case registerPasswordError:
        message =
            'No se ha ingresado una contraseña o se ha ingresado una contraseña vacía';
        break;
      case registerObligatoryError:
        message =
            'No se ha ingresado un valor para uno de los campos obligatorios';
        break;
      case registerDniError:
        message = 'El DNI ingresado ya existe';
        break;
      case registerMailError:
        message = 'El mail ingresado ya existe';
        break;
      case invalidTokenError:
        message = 'El token ingresado es incorrecto';
        break;
      case mailNotRegisteredError:
        message = 'El correo ingresado no esta registrado';
        break;
      case noEventCodeError:
        message = 'El código ingresado no es válido';
        break;
      case wrongAccessCodeError:
        message = 'El código de acceso es invalido para este evento';
        break;
      case noMatchingIdError:
        message = 'El DNI ingresado no existe';
        break;
      case invalidAuthTokenError:
        message = 'El token ingresado es invalido';
        break;
      default:
        message = 'Ocurrió un error desconocido';
        break;
    }
  }

  @override
  String toString() => 'Error $statusCode. $message.';
}
