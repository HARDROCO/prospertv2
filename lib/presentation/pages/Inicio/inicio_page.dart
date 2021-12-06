
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:modulos/presentation/pages/Inicio/widgets/inicio_body.dart';

// -------------- PAGINA INICIO----------------------
// INICIO: construir pagina inicio con logo y dos botones

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: AppBar(
        //   title: Text('Home'),
        // ),
        body: BodyInicio());
  }
}