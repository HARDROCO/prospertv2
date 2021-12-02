import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/presentation/pages/screen/estados_screen.dart';

class PageEstados extends StatelessWidget {
  final ThemeController controller = Get.find();
  PageEstados({Key? key}) : super(key: key);

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MinticMobile-Grupo5',
      home: Scaffold(
          body: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),

              //Aqui se llama a la clase que contine toda la magia
              child: ResponseEstados(controller: controller),
            ),
          ),
          backgroundColor: Colors.white10,
      ),
    );
  }
}