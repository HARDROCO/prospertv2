// BOTON GOOGLE LOGIN: create a button to log in wth google

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ButtonGoogle extends StatelessWidget {
  final String textobtn;

  const ButtonGoogle({Key? key, required this.textobtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: MaterialButton(
        color: Colors.white,
        minWidth: 250.0,
        height: 50.0,
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/googleicon.png',
              width: 30.0,
              height: 30.0,
            ),
            const SizedBox(
              width: 65.0,
            ),
            Text(textobtn,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        onPressed: () {
          _irPage4(textobtn);
          print('boton funcionando');
        },
      ),
    );
  }

// REDIRECCION: metodo para redireccionar a cada pagina desde menu
  void _irPage4(String textobtn) {
    if (textobtn == 'Login with Google') {
      Get.toNamed('/ImageGoogle');
    } else if (textobtn == 'Sign up with Google') {
      Get.toNamed('/Profile');
    } else {
      Get.toNamed('/Inicio');
    }
  }
}
