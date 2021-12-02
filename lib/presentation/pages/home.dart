import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/presentation/pages/screen/home_screen.dart';

class Pagehome extends StatelessWidget {

  final ThemeController controller = Get.find();
  Pagehome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MinticMobile-Grupo5',

      //Aqui llamo a la clase ResponsePage
      //home: ResponsePage (),
      home: Scaffold(
          body: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),

              //Aqui se llama a la clase que contine toda la magia
              child: ResponseHome(controller: controller),
            ),
          ),
          backgroundColor: Colors.white10,
      ),
    );
  }
}
