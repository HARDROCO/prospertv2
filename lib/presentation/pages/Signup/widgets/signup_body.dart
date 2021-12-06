// BODY LOGIN: crear widget con la estrcutura de la paginad e login
import 'package:flutter/material.dart';
import 'package:modulos/presentation/widgets/Textbox/textbox_default.dart';
import 'package:modulos/presentation/widgets/botones/boton_default.dart';
import 'package:modulos/presentation/widgets/botones/btn_google.dart';
import 'package:modulos/presentation/widgets/botones/btn_text.dart';
import 'package:modulos/presentation/widgets/logo_default.dart';

class BodySignup extends StatelessWidget {
  final String textobtn = "";

  const BodySignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            // colocar imagen de fonde desde local
            image: AssetImage('assets/fondo3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(10),
          //widgets inicio de sesión
          children: <Widget>[
            Logo(height: 100.0, width: 50.0),
            // Titulo(),
            Textbox(lbltext: "Usuario", hidetxt: false, paddx: 20, paddy: 8),
            Textbox(lbltext: "Contraseña", hidetxt: true, paddx: 20, paddy: 8),
            Textbox(lbltext: "Correo", hidetxt: false, paddx: 20, paddy: 8),
            const SizedBox(height: 6.0),
            // botones
            BotonDefault(textobtn: 'Registrarse'),
            ButtonGoogle(textobtn: 'Sign up with Google'),
            Txtbtn(
                textobtn: 'Iniciar Sesión',
                fntsize: 15,
                colorbtn: Colors.grey.shade700),
            // Spacer()
          ],
        ));
  }
}
