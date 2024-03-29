import 'package:flutter/material.dart';

const UNKNOWN_ERROR = 999;
// Login error
const LOGIN_USERNAME_ERROR = 1001;
const PASSWORD_LOGIN_ERROR = 1002;
const LOGIN_CREDENTIALS_ERROR = 1003;
// Forgot password error
const MAIL_NOT_REGISTERED_ERROR = 1004;
const INVALID_TOKEN_ERROR = 1006;
// Register error
const REGISTER_USERNAME_ERROR = 2001;
const REGISTER_PASSWORD_ERROR = 2002;
const REGISTER_DNI_ERROR = 2006;
const REGISTER_MAIL_ERROR = 2005;
const REGISTER_OBLIGATORY_ERROR = 2003;
const NO_MATCHING_ID_ERROR = 2009;
// Event errors
const NO_EVENT_CODE_ERROR = 4007;
const WRONG_ACCESS_CODE_ERROR = 4008;
// Auth errors
const INVALID_AUTH_TOKEN_ERROR = 401;

class BoxtingException implements Exception {
  final int statusCode;
  String message;
  BoxtingException({@required this.statusCode}) {
    switch (statusCode) {
      case UNKNOWN_ERROR:
        message = 'Ocurrió un error desconocido';
        break;
      case LOGIN_USERNAME_ERROR:
        message = 'El usuario o contraseña ingresado es incorrecto';
        break;
      case PASSWORD_LOGIN_ERROR:
        message = 'El usuario o contraseña ingresado es incorrecto';
        break;
      case LOGIN_CREDENTIALS_ERROR:
        message =
            'Las credenciales de acceso utilizadas no pertenecen al login / El rol no tiene permiso para iniciar sesión con esa ruta';
        break;
      case REGISTER_USERNAME_ERROR:
        message = 'El nombre de usuario ingresado ya existe';
        break;
      case REGISTER_PASSWORD_ERROR:
        message =
            'No se ha ingresado una contraseña o se ha ingresado una contraseña vacía';
        break;
      case REGISTER_OBLIGATORY_ERROR:
        message =
            'No se ha ingresado un valor para uno de los campos obligatorios';
        break;
      case REGISTER_DNI_ERROR:
        message = 'El DNI ingresado ya existe';
        break;
      case REGISTER_MAIL_ERROR:
        message = 'El mail ingresado ya existe';
        break;
      case INVALID_TOKEN_ERROR:
        message = 'El token ingresado es incorrecto';
        break;
      case MAIL_NOT_REGISTERED_ERROR:
        message = 'El correo ingresado no esta registrado';
        break;
      case NO_EVENT_CODE_ERROR:
        message = 'El código ingresado no es válido';
        break;
      case WRONG_ACCESS_CODE_ERROR:
        message = 'El código de acceso es invalido para este evento';
        break;
      case NO_MATCHING_ID_ERROR:
        message = 'El DNI ingresado no existe';
        break;
      case INVALID_AUTH_TOKEN_ERROR:
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
