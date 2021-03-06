import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:modulos/data/services/notification.dart';

class NotificationManager {
  final _service = NotificationService();

  // TODO
  //Inicializa el pluggin de notificaciones
  initialize() async {
    await _service.initialize();
  }

  // TODO
  //Crea el canal para notificaciones
  NotificationDetails createChannel(
      {required String id, required String name, required String description}) {
    return _service.createChannel(id: id, name: name, description: description);
  }

  void showNotification(
      {required NotificationDetails channel,
      required String title,
      required String body}) async {
    await _service.showNotification(
        title: title, body: body, /*detalle es el canal */ details: channel);
  }
}
