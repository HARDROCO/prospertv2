import 'package:flutter/material.dart';

// CUADROS DE TEXTO : CLASE PARA CREAR CUADROS DE TEXTO ESTANDAR PARA LA APPLLICACION DEACUERDO A LOS PARAMETROS DE ENTRADA
// para captrar entradas se deben agregar controladores y poner todo en un stafulwidget
class Textbox extends StatelessWidget {
  final String lbltext; // ETIQUETA DEL TEXTO
  final bool hidetxt; // true or false
  final double paddx; // PADDING HORIZONTAL
  final double paddy; // PADDING VERTICAL

  Textbox(
      {Key? key,
      required this.lbltext,
      required this.hidetxt,
      required this.paddx,
      required this.paddy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddx, vertical: paddy),
      child: TextField(
        //controller: _txtcontroller,
        obscureText: hidetxt, // ocualta contraseña
        decoration: InputDecoration(
            //put a border color
            border: const UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
            labelText: lbltext,
            //hintText: 'Usuario',
            fillColor: Colors.white30,
            filled: true),
        onChanged: (text) {
          print("texto escrito: $text");
        },
      ),
    );
  }
}
