import 'package:flutter/material.dart';
import 'package:get/get.dart';

// CUADROS DE TEXTO : CLASE PARA CREAR CUADROS DE TEXTO ESTANDAR PARA LA APPLLICACION DEACUERDO A LOS PARAMETROS DE ENTRADA
// para captrar entradas se deben agregar controladores y poner todo en un stafulwidget
class Textbox extends StatefulWidget {
  final String lbltext; // ETIQUETA DEL TEXTO
  final bool hidetxt; // true or false
  final double paddx; // PADDING HORIZONTAL
  final double paddy; // PADDING VERTICAL
  final TextEditingController txtController; // CONTROLADOR DE TEXTO

  Textbox(
      {Key? key,
      required this.lbltext,
      required this.hidetxt,
      required this.paddx,
      required this.paddy,
      required this.txtController})
      : super(key: key);

  @override
  State<Textbox> createState() => _TextboxState();
}

class _TextboxState extends State<Textbox> {
  // Crea un controlador de texto. Lo usaremos para recuperar el valor actual
  // del TextField!
  final String txtfield = ""; // valor del campo de texto

  //final _txtController = TextEditingController();

  // build a init state
  @override
  void initState() {
    super.initState();
    // Inicializa el controlador con el valor del texto
    widget.txtController.text = txtfield;
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    widget.txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widget.paddx, vertical: widget.paddy),
      child: TextField(
        controller: widget.txtController,
        obscureText: widget.hidetxt, // ocualta contraseña
        decoration: InputDecoration(
            //put a border color
            border: const UnderlineInputBorder(
              //borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
            labelText: widget.lbltext,
            //hintText: 'Usuario',
            fillColor: Colors.white30,
            filled: true),
        onChanged: (text) {
          print("texto escrito: $text");
          print("controller: ${widget.txtController.text}");
        },
        // create a float buttom

      ),
    );
  }
}









// import 'package:flutter/material.dart';

// // CUADROS DE TEXTO : CLASE PARA CREAR CUADROS DE TEXTO ESTANDAR PARA LA APPLLICACION DEACUERDO A LOS PARAMETROS DE ENTRADA
// // para captrar entradas se deben agregar controladores y poner todo en un stafulwidget
// class Textbox extends StatelessWidget {
//   final String lbltext; // ETIQUETA DEL TEXTO
//   final bool hidetxt; // true or false
//   final double paddx; // PADDING HORIZONTAL
//   final double paddy; // PADDING VERTICAL

  
//   Textbox(
//       {Key? key,
//       required this.lbltext,
//       required this.hidetxt,
//       required this.paddx,
//       required this.paddy})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: paddx, vertical: paddy),
//       child: TextField(
//         //controller: _txtcontroller,
//         obscureText: hidetxt, // ocualta contraseña
//         decoration: InputDecoration(
//             //put a border color
//             border: const UnderlineInputBorder(
//               //borderRadius: BorderRadius.circular(10.0),
//               borderSide: BorderSide(color: Colors.deepPurple),
//             ),
//             labelText: lbltext,
//             //hintText: 'Usuario',
//             fillColor: Colors.white30,
//             filled: true),
//         onChanged: (text) {
//           print("texto escrito: $text");
//         },
//       ),
//     );
//   }

// }



