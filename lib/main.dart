import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:modulos/presentation/pages/Inicio/inicio_page.dart';
import 'package:modulos/presentation/pages/Login/login_page.dart';
import 'package:modulos/presentation/pages/Signup/signup_page.dart';
import 'package:modulos/presentation/pages/test_pages/filas_colum_list.dart';
// import 'package:modulos/presentation/pages/filas_colum_list.dart';
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
      home: InicioPage(),
      // rutas
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/Inicio',
            page: () => InicioPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/Login',
            page: () => LoginPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/Signup',
            page: () => SignupPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/Profile',
            page: () => ProfilePage(),
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
            name: '/Home',
            page: () => VistaPpal(),
            transition: Transition.fadeIn),
      ],
    );
  }
}
