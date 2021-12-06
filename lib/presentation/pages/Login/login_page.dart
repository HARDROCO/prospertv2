import 'package:flutter/material.dart';
import 'package:modulos/presentation/pages/Login/widgets/login_body.dart';
import 'package:modulos/presentation/widgets/appbar_default.dart';

// ---------------------PAGINA LOG IN-----------------------------
// LOG IN: Pagina de incio de sesion
class LoginPage extends StatelessWidget {
  // constructor de clase
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "Iniciar Sesión"), body: BodyLogin());
  }
}
