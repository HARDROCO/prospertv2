import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modulos/domain/models/mensaje.dart';
import 'package:modulos/domain/models/mensaje_A.dart';
import 'package:modulos/presentation/widgets/mensajewidget.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class ListaMensajes extends StatefulWidget {
  ListaMensajes({Key? key}) : super(key: key);
  final mensajeA = MensajeA();

  @override
  _ListaMensajesState createState() => _ListaMensajesState();
}

class _ListaMensajesState extends State<ListaMensajes> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _mensajesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _scrollHaciaAbajo()); //bajar

    //return

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _getListaMensajes(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: _mensajesController,
                        onChanged: (text) => setState(() {}),
                        onSubmitted: (input) {
                          _enviarMensaje();
                        },
                        decoration:
                            InputDecoration(hintText: 'Escribe un Mensaje'),
                      )),
                ),
                IconButton(
                  icon: Icon(_puedoEnviarMensaje()
                      ? CupertinoIcons.arrow_right_circle_fill
                      : CupertinoIcons.arrow_right_circle),
                  onPressed: () {
                    _enviarMensaje();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getListaMensajes() {
    return Expanded(
      child: FirebaseAnimatedList(
        controller: _scrollController,
        query: widget.mensajeA.getMensajes(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final mensaje = Mensaje.fromJson(json);
          return MensajeWidget(mensaje.texto, mensaje.fecha);
        },
      ),
    );
  }

  void _scrollHaciaAbajo() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  void _enviarMensaje() {
    if (_puedoEnviarMensaje()) {
      final mensaje = Mensaje(_mensajesController.text, DateTime.now());
      widget.mensajeA.guardarMensaje(mensaje);
      _mensajesController.clear();
      setState(() {});
    }
  }

  bool _puedoEnviarMensaje() => _mensajesController.text.length > 0;
}
