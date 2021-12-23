import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modulos/domain/use_case/controllers/state_controllers.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/presentation/pages/nav.dart';
import 'package:modulos/presentation/widgets/Textbox/textbox_default.dart';
import 'package:modulos/presentation/widgets/appbar.dart';

class PostState extends StatefulWidget {
  const PostState({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<PostState> {
  final ThemeController controller = Get.find();
  final String textobtn = "";
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController ubicacionController = TextEditingController();
  final int page = 3;

  //  llamar al autentificador de iniciond de sesion
  StateController statecontroller = Get.put(StateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        controller: controller,
        tile: const Text("Tu post"),
        context: context,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Textbox(
              lbltext: "Usuario",
              hidetxt: false,
              paddx: 20,
              paddy: 8,
              txtController: usuarioController),
          Textbox(
              lbltext: "Descripcion",
              hidetxt: false,
              paddx: 20,
              paddy: 8,
              txtController: descripcionController),
          Textbox(
              lbltext: "Ubicacion",
              hidetxt: false,
              paddx: 20,
              paddy: 8,
              txtController: ubicacionController),
          const SizedBox(height: 6.0),
          ElevatedButton(
            onPressed: () {
              StateController statecontroller = Get.find();
              statecontroller.addState(usuarioController.text,
                  descripcionController.text, ubicacionController.text);
              Get.to(Nav(page));
            },
            child: Text('Publicar'),
          )
        ],
      ),
      backgroundColor: Colors.white10,
    );
  }
}
