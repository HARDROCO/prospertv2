import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:modulos/domain/use_case/controllers/authentication_controller.dart';
import 'package:modulos/presentation/pages/Login/login_page.dart';

// BOTONES: crear un widget que reciba una funcion y retorne un boton
class BotonDefault extends StatefulWidget {
  final String textobtn;
  final TextEditingController uscontroller;
  final TextEditingController psscontroller;
  final String routebtn;

  BotonDefault(
      {Key? key,
      required this.textobtn,
      required this.uscontroller,
      required this.psscontroller,
      required this.routebtn})
      : super(key: key);

  BotonDefault.nocontroller(
      {Key? key, required this.textobtn, required this.routebtn})
      : uscontroller = TextEditingController(text: ""),
        psscontroller = TextEditingController(text: ""),
        super(key: key);

  @override
  State<BotonDefault> createState() => _BotonDefaultState();
}

class _BotonDefaultState extends State<BotonDefault> {
  //  llamar al autentificador de iniciond de sesion
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  String _errorMessage = "";

  // validnado login segun los controladores pasados al boton
  _login(theEmail, thePassword) async {
    print('_login funcion boton $theEmail $thePassword');
    bool result = true;
    try {
      await authenticationController.login(theEmail, thePassword);
    } catch (err) {
      //catch error in a variable
      _errorMessage = err.toString();
      result = false;
    }
    if (result == true) {
      // si datos correctos redireccionar a la pagina principal
      Get.offAllNamed('/Home');
    } else {
      // si datos incorrectos mostrar mensaje de error
      if (_errorMessage == 'unknown error') {
        print('error desconocido');
      } else {
        Get.snackbar(
          "Login",
          _errorMessage,
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: MaterialButton(
        color: const Color.fromARGB(255, 83, 68, 145),
        height: 50.0,
        // add horizontal paddind at the left and right
        child: Text(widget.textobtn,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),
        onPressed: () async {
          await _login(widget.uscontroller.text, widget.psscontroller.text);
          if (widget.textobtn == 'Ir a Inicio Sesión') {
            Get.toNamed(widget.routebtn);
            // _irPage(widget.textobtn, widget.routebtn);
          } else if (widget.textobtn == 'Ir a Registrarse') {
            Get.toNamed(widget.routebtn);
            //_irPage(widget.textobtn, widget.routebtn);
          }
          print('boton redireccionando');
          print(widget.uscontroller.text);
        },
      ),
    );
  }
}

// // REDIRECCION: metodo para redireccionar a cada pagina desde menu
// void _irPage(String textobtn, String routebtn) {
//   Get.toNamed(routebtn);
//   print(textobtn);

// // REDIRECCION: metodo para redireccionar a cada pagina desde menu
// void _irPage(String textobtn) {
//   if (textobtn == 'Ir a Inicio Sesión') {
//     Get.toNamed('/Login');
//     print("se presiono el boton de inicio de sesion");
//   } else if (textobtn == 'Ir a Registrarse') {
//     Get.toNamed('/Signup');
//     } else if (textobtn == 'Iniciar Sesión') {
//       Get.toNamed('/Home');
//   } else if (textobtn == 'Registrarse') {
//     Get.toNamed('/Profile');
//   } else {
//     Get.toNamed('/Inicio');
//   }

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
//}
