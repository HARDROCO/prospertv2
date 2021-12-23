import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/presentation/pages/post_state.dart';
import 'package:modulos/presentation/pages/screen/post_screen.dart';

class PagePost extends StatelessWidget {
  final ThemeController controller = Get.find();
  PagePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MinticMobile-Grupo5',
      home: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),

            //Aqui se llama a la clase que contine toda la magia
            child: ResponsePost(controller: controller),
          ),
        ),
        backgroundColor: Colors.white10,
        //boton para agregar estados
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => PostState());
            },
            backgroundColor: Colors.purple[300],
            child: const Icon(Icons.add)),
      ),
    );
  }
}
