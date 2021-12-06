import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:modulos/presentation/pages/filas_colum_list.dart';
import 'package:modulos/presentation/theme/theme.dart';
import 'package:modulos/presentation/pages/vistas.dart';

void main() {
  runApp(const MyApp());
}

// construir una clase para el widget MyApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Social Network peliculas',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.ligthTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.system,
      //home: MyHomePage(),
      home: HomePage(),
      // rutas
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/Home',
            page: () => HomePage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/Login',
            page: () => InicioSesion(),
            transition: Transition.zoom),
        GetPage(
            name: '/Signup',
            page: () => SignUpPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/Profile',
            page: () => ProfileUI2,
            transition: Transition.fadeIn),
        GetPage(
            name: '/ImageGoogle',
            page: () => ImageGoogle(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/TesterPage',
            page: () => TesterPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/VistaPpal',
            page: () => VistaPpal(),
            transition: Transition.fadeIn),
      ],
    );
  }
}
