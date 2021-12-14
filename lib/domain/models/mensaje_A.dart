
import 'package:firebase_database/firebase_database.dart';
import 'package:modulos/domain/models/mensaje.dart';


class MensajeA {
  final DatabaseReference _mensajeRef =FirebaseDatabase.instance.reference()
  .child('mensajes');

  void guardarMensaje(Mensaje mensaje) {
    _mensajeRef.push().set(mensaje.toJson());
  }

Query getMensajes()=>_mensajeRef;
  
}