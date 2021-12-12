import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modulos/domain/use_case/controllers/state_controllers.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/presentation/widgets/appbar.dart';

class PostState extends StatefulWidget {
  const PostState({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<PostState> {
  final ThemeController controller = Get.find();
  final usuarioController = TextEditingController();
  final descripcionController = TextEditingController();
  final ubicacionController = TextEditingController();
  final List<String> tasks = <String>[];

    //  llamar al autentificador de iniciond de sesion
  StateController statecontroller =
      Get.put(StateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        controller: controller,
        tile: const Text("Tu post"),
        context: context,
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Añada su estado",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.purple[300]
              )
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              //para que al pasar el mouse se active el teclado
              autofocus: true,
              //reciba ciertos datos number, datetime etc 
              keyboardType: TextInputType.text,
              //autocorrecciones con true
              autocorrect: false,
              //alineacion del fiel
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Usuario',
                prefixIcon: Icon(Icons.person, color: Colors.purple[300]),
                
              ),
        
            controller: usuarioController,
            onSubmitted: _addItem,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              //para que al pasar el mouse se active el teclado
              autofocus: true,
              //reciba ciertos datos number, datetime etc 
              keyboardType: TextInputType.text,
              //autocorrecciones con true
              autocorrect: false,
              //alineacion del fiel
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Ubicación',
                prefixIcon: Icon(Icons.location_on, color: Colors.purple[300]),
                
              ),
         
            controller: ubicacionController,
            onSubmitted: _addItem,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              //para que al pasar el mouse se active el teclado
              autofocus: true,
              //reciba ciertos datos number, datetime etc 
              keyboardType: TextInputType.text,
              //autocorrecciones con true
              autocorrect: false,
              //alineacion del fiel
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Descripcion',
                prefixIcon: Icon(Icons.book_sharp,color: Colors.purple[300]),
                
              ),
         
            controller: descripcionController,
            onSubmitted: _addItem,
            ),
          ),
          
          
       
          ElevatedButton(
            onPressed: () {
              statecontroller.addState(usuarioController.text,
                  descripcionController.text, ubicacionController.text);
            },
            child: Text('Publicar'),
          )
        ],
      ),
      backgroundColor: Colors.white10,
    );
  }

  _addItem(value) {
    usuarioController.clear();
    descripcionController.clear();
    ubicacionController.clear();
    setState(() {
      tasks.add(value);
    });
  }
}
