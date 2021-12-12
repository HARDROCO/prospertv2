import 'package:get/get.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:modulos/presentation/pages/estados.dart';
import 'package:modulos/presentation/pages/home.dart';
import 'package:modulos/presentation/pages/chat.dart';
import 'package:modulos/presentation/pages/post.dart';
import 'package:modulos/presentation/pages/publicaciones.dart';
import 'package:modulos/presentation/widgets/appbar.dart';

class Nav extends StatefulWidget {
  @override
  State<Nav> createState() => _MyNav();
}

class _MyNav extends State<Nav> {
  final ThemeController controller = Get.find();
  int _paginaActual = 0;
  final List<Widget> _paginas = [
    Pagehome(),
    PageSocial(),
    PageEstados(),
    Pagechat(),
    Pagepost(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,
      //title: 'Mintic',
      //home: Scaffold(
      appBar: CustomAppBar(
        controller: controller,
        tile: const Text("ProsperTv"),
        context: context,
      ),
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.purple[700],
        type: BottomNavigationBarType.fixed,
        onTap: (posicion) {
          setState(() {
            _paginaActual = posicion;
          });
        },
        currentIndex: _paginaActual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.social_distance), label: "Social"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_sharp), label: "Estados"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_returned_outlined), label: "Post"),
        ],
      ),
    );
  }
}
