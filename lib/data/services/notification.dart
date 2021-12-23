import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:modulos/domain/services/notification.dart';

class NotificationService implements NotificationInterface {
  final _plugin = FlutterLocalNotificationsPlugin();

  // TO DO
  // Establece la configuración inicial e inicializa el pluggin FlutterLocalNotificationsPlugin
  @override
  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _plugin.initialize(initializationSettings);
  }

  // TO DO
  // Crea el canal para notificaciones con una importancia y prioridad maxima
  @override
  NotificationDetails createChannel(
      {required String id, required String name, required String description}) {
    final AndroidNotificationDetails androidPlataformChannelSpecifics =
        AndroidNotificationDetails(
      id,
      name,
      channelDescription: description,
      //darle la importancia y prioridad
      importance: Importance.max,
      priority: Priority.max,
    );

    //que voy a retornar? toda la informacion de arriba
    return NotificationDetails(android: androidPlataformChannelSpecifics);
  }

  @override
  Future<void> showNotification(
      {required String title,
      required String body,
      required NotificationDetails details}) async {
    await _plugin.show(0, title, body, details);
  }
}
