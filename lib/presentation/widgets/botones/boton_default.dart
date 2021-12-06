import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

// BOTONES: crear un widget que reciba una funcion y retorne un boton
class BotonDefault extends StatelessWidget {
  final String textobtn;

  BotonDefault({Key? key, required this.textobtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: MaterialButton(
        color: const Color.fromARGB(255, 83, 68, 145),
        height: 50.0,
        // add horizontal paddind at the left and right
        child: Text(textobtn,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),
        onPressed: () {
          _irPage(textobtn);
          print('boton redireccionando');
        },
      ),
    );
  }
}

// REDIRECCION: metodo para redireccionar a cada pagina desde menu
void _irPage(String textobtn) {
  if (textobtn == 'Ir a Inicio Sesión') {
    Get.toNamed('/Login');
  } else if (textobtn == 'Ir a Registrarse') {
    Get.toNamed('/Signup');
  } else if (textobtn == 'Iniciar Sesión') {
    Get.toNamed('/Home');
  } else if (textobtn == 'Registrarse') {
    Get.toNamed('/Profile');
  } else {
    Get.toNamed('/Inicio');
  }

//  BOTONES----
  // // widget para crear boton de inicio de sesión 2
  // Widget BotonInicio2(texto) {
  //   return MaterialButton(
  //     color: Color.fromARGB(255, 83, 68, 145),
  //     minWidth: 370.0,
  //     height: 50.0,
  //     child: Text('Iniciar Sesión',
  //         style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 15.0,
  //             fontWeight: FontWeight.bold)),
  //     onPressed: () {
  //       print('boton funcionando 2');
  //     },
  //   );
  // }

// // REDIRECCION SIGNUP: metodo para redireccionar a cada pagina desde menu
//   void _irPage2(context, String textobtn) {
//     if (textobtn == 'Registrarse') {
//       Get.toNamed('/Profile');
//     } else if (textobtn == 'Sign up with Google') {
//       Get.toNamed('/ImageGoogle');
//     } else if (textobtn == 'Iniciar Sesión') {
//       Get.toNamed('/Login');
//     } else {
//       Get.to(HomePage()); // forma sin ruta de ir
//     }
//   }
}
