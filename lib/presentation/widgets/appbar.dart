import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/presentation/pages/Inicio/inicio_page.dart';
// import 'package:modulos/presentation/pages/chat.dart';
// import 'package:modulos/presentation/pages/publicaciones.dart';
import 'package:modulos/presentation/pages/test_pages/filas_colum_list.dart';

class CustomAppBar extends AppBar {
  final Widget tile;
  final BuildContext context;
  final ThemeController controller;

  // Creating a custom AppBar that extends from Appbar with super();
  CustomAppBar({
    Key? key,
    required this.controller,
    required this.context,
    required this.tile,
  }) : super(
          key: key,
          centerTitle: true,
          title: tile,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
              icon: Obx(
                () => Icon(
                  controller.darkMode
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                ),
              ),
              onPressed: () => controller.darkMode = !controller.darkMode,
            ),
            IconButton(
              icon: Icon(Icons.add_reaction_outlined),
              onPressed: () {
                Get.off(() => ProfilePage());
              },
            ),
            IconButton(
                onPressed: () {
                  Get.off(() => InicioPage());
                },
                icon: Icon(Icons.logout)),
          ],
          backgroundColor: Color.fromARGB(255, 83, 68, 145),
        );
}
