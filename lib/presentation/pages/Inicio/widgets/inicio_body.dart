import 'package:flutter/material.dart';
import 'package:modulos/presentation/widgets/botones/boton_default.dart';
import 'package:modulos/presentation/widgets/logo_default.dart';

// widget que crea el body de la pagina de inicio
class BodyInicio extends StatelessWidget {
  final String textobtn = "";

  const BodyInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // imagen de fondo del contenedor local
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          // top margin
          margin: EdgeInsets.only(top: 70),
          child: Column(
            // alineacion del contenido
            crossAxisAlignment: CrossAxisAlignment.stretch, // o center
            mainAxisAlignment: MainAxisAlignment.start,
            // widgets que contendra la pagina
            children: <Widget>[
              // imagen principal de home
              Logo(height: 200.0, width: 250.0),
              const SizedBox(height: 30.0),
              // boton para ir a la pagina de login
              BotonDefault(
                  textobtn: 'Ir a Inicio Sesión'),
              const SizedBox(height: 20.0),
              BotonDefault(
                  textobtn: 'Ir a Registrarse'),
            ],
          ),
        ));
  }
}
