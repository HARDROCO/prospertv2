import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/domain/use_case/controllers/state_controllers.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';

class ResponsePost extends StatelessWidget {
  final ThemeController controller;


  const ResponsePost({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<StateController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: controller.listStates.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.person_outline_outlined),
                        onPressed: () {},
                      ),
                      Text("Usuario:  ${controller.listStates[index].usuario}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                          "Descripcion: ${controller.listStates[index].descripcion}"),
                      //separacion
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Ubicacion: ${controller.listStates[index].ubicacion}",
                          style: TextStyle(fontWeight: FontWeight.w300)),
                    ],
                  ))
                ],
              ),
            );
          },
        );
      },
    );
  }
}
