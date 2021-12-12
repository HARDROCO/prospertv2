import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/domain/use_case/controllers/authentication_controller.dart';
import 'package:modulos/presentation/widgets/Textbox/textbox_default.dart';
import 'package:modulos/presentation/widgets/botones/boton_default.dart';
import 'package:modulos/presentation/widgets/botones/btn_google.dart';
import 'package:modulos/presentation/widgets/botones/btn_text.dart';
import 'package:modulos/presentation/widgets/logo_default.dart';

// BODY LOGIN: crear widget con la estrcutura de la paginad e login
class BodyLogin extends StatefulWidget {
  BodyLogin({Key? key}) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final String textobtn = "";

  TextEditingController usercontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();

  // AuthenticationController authenticationController =
  //     Get.put(AuthenticationController());

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
            // cuadros de texto
            Textbox(
                lbltext: "Usuario",
                hidetxt: false,
                paddx: 20,
                paddy: 8,
                txtController: usercontroller),
            Textbox(
                lbltext: "Contraseña",
                hidetxt: true,
                paddx: 20,
                paddy: 8,
                txtController: passcontroller),
            const SizedBox(height: 6.0),
            // botones
            BotonDefault(
                textobtn: 'Iniciar Sesión',
                uscontroller: usercontroller,
                psscontroller: passcontroller, routebtn: '/Home'),
            ButtonGoogle(textobtn: 'Login with Google'),
            Txtbtn(
                textobtn: '¿Olvidaste la Contraseña?',
                fntsize: 15,
                colorbtn: Colors.grey.shade700),
            Txtbtn(
                textobtn: 'Registrarse',
                fntsize: 15,
                colorbtn: Colors.grey.shade700),
            // Spacer()
          ],
        ));
  }

}
