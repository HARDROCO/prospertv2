import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:modulos/domain/use_case/controllers/notifications.dart';
import 'package:modulos/domain/use_case/controllers/state_controllers.dart';
import 'package:modulos/domain/use_case/location_management.dart';
import 'package:modulos/domain/use_case/notification_management.dart';
import 'package:modulos/presentation/pages/Inicio/inicio_page.dart';
import 'package:modulos/presentation/pages/Login/login_page.dart';
import 'package:modulos/presentation/pages/Signup/signup_page.dart';
import 'package:modulos/presentation/pages/test_pages/filas_colum_list.dart';
// import 'package:modulos/presentation/pages/filas_colum_list.dart';
import 'package:modulos/presentation/theme/theme.dart';
import 'package:modulos/presentation/pages/vistas.dart';
import 'package:workmanager/workmanager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 1. TO DO: Crea el controlador de notificaciones e inicializa el pluggin

  NotificationController notificationController =
      Get.put(NotificationController());
  notificationController.initialize();
  // 2. TO DO:
  // Crea el canal para notificaciones
  notificationController.createChannel(
      id: 'user-location',
      name: 'User Location',
      description: 'My location...');

  // 4. TO DO:
  // Inicializa el Workmanager con el metodo creado y registra la tarea periodica
  await Workmanager().initialize(updatePositionInBackground);
  await Workmanager().registerPeriodicTask('1', 'localPeriodicTask');

  // asegura de inicializar toda las dependencias que necesita flutter al cargar la app
  Get.put(StateController());
  WidgetsFlutterBinding.ensureInitialized();
  // esto busca en la carpeta de android y verifica la config json para inicilizar un poryecto de firebase asociado e inicializa todo antes de lanzar
  Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

// 3. TO DO:
// Crea un metodo que cree una tarea, obtenga la ubicación
// y la muestre en una notificación
void updatePositionInBackground() async {
  final manger = LocationManager();
  final _manager = NotificationManager();
  Workmanager().executeTask((taskName, inputData) async {
    await _manager.initialize();
    final _channel = _manager.createChannel(
      id: 'user-location',
      name: 'User Location',
      description: 'My location...',
    );
    //ahora le voy a pasar la posicion
    final position = await manger.getCurrentLocation();
    //le paso esa ubicacion a mis notificaciones al show notification que esta en notification_management.dart
    _manager.showNotification(
        channel: _channel,
        //me va aparecer en la notificacion
        title: 'tu ubicacion es: ',
        body: 'Latitud ${position.latitude} - Longitud ${position.longitude}');
    //creo mi notificacion y me la va a mostrar en segundo plano
    return Future.value(true);
  });
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
