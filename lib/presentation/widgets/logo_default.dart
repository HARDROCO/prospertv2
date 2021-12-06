import 'package:flutter/material.dart';

// LOGO: widget para el logo de la app que cargue una imagen de local
class Logo extends StatelessWidget {
  final double width;
  final double height;

  const Logo({required this.width, required this.height}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        // margen del contenedor
        margin: const EdgeInsets.all(8),
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Image.asset('assets/LOGO2.png', width: width, height: height));
  }
}
