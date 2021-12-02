import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pagepost extends StatefulWidget {
  
  const Pagepost({Key? key}) : super(key: key);

  @override
  _State createState() => _State();

}

class _State extends State<Pagepost> {
  final nameController = TextEditingController();
  final titulo = TextEditingController();
  final descripcion = TextEditingController();
  final ubicacion = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:Text(
              "Creación de post", style: TextStyle(fontSize: 30),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: const Key("signUpTitulo"),
              controller: titulo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'titulo',
              ),
            ),
          ),
          Padding(
            
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: const Key("signUpDescripcion"),
              controller: descripcion,
              decoration: const InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 60.1),
                border: OutlineInputBorder(),
                labelText: '  descripcion',
              ),
            ),
             
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: const Key("signUpUbicacion"),
              controller: ubicacion,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ubicacion',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                ),
              ),
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.purple,
            ),
            
            onPressed:() => {} ,
            child: const Text("publicar"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    titulo.dispose();
    descripcion.dispose();
    ubicacion.dispose();
  }

}

