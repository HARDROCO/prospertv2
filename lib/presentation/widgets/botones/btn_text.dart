import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

// botones de texto con funciones especificas

class Txtbtn extends StatelessWidget {
  final String textobtn; // texto del boton
  final double fntsize; // tamaño de la fuente 15
  final Color colorbtn; // color del boton Colors.grey[700]

  Txtbtn(
      {Key? key,
      required this.textobtn,
      required this.fntsize,
      required this.colorbtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(textobtn,
          style: TextStyle(
              color: colorbtn, fontSize: fntsize, fontWeight: FontWeight.bold)),
      onPressed: () {
        _irPage3(textobtn);
        print('boton funcionando');
      },
    );
  }

// REDIRECCION: metodo para redireccionar a cada pagina desde menu
  void _irPage3(String textobtn) {
    if (textobtn == '¿Olvidaste la Contraseña?') {
      Get.toNamed('/TesterPage');
    } else if (textobtn == 'Registrarse') {
      Get.toNamed('/Signup');
    } else if (textobtn == 'Iniciar Sesión') {
      Get.toNamed('/Login');
    } else {
      Get.toNamed('/Inicio');
    }
  }
}
