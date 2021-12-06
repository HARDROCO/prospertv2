import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';


// APPBAR: widget para el appbar de cualquier pagina utilizando los colores y temas de la app
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
    final String title;

    AppBarWidget({required this.title}) : preferredSize = const Size.fromHeight(kToolbarHeight);

    @override
    final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // colocar icono de volver en appbar
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[700]),
        onPressed: () {
          // volver a la pagina anterior
          Get.back();
          print("volver");
        },
      ),
      title: Text(title, style: TextStyle(color: Colors.grey[700])),
      // color de appbar
      backgroundColor: Colors.white,
    );
    }
}





