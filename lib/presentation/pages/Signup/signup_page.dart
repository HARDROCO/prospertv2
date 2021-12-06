//------- PAGINA REGISTRO USUARIO --------
// REGISTRO USUARIO: Pagina de registro de usuario

import 'package:flutter/material.dart';
import 'package:modulos/presentation/pages/Signup/widgets/signup_body.dart';
import 'package:modulos/presentation/widgets/appbar_default.dart';

class SignupPage extends StatelessWidget {
  // constructor de clase
  SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarWidget(title: "Registrarse"), body: BodySignup());
  }

}
