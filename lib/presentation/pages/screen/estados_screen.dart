import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/data/services/article_pool.dart';
import 'package:modulos/domain/models/article_model.dart';
import 'package:modulos/domain/use_case/controllers/location.dart';
import 'package:modulos/domain/use_case/controllers/notifications.dart';
import 'package:modulos/domain/use_case/controllers/permissions.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/domain/use_case/location_management.dart';
import 'package:url_launcher/url_launcher.dart';

class ResponseEstados extends StatefulWidget {
  final ThemeController controller;

  const ResponseEstados({Key? key, required this.controller}) : super(key: key);

  @override
  State<ResponseEstados> createState() => _ResponseEstadosState();
}

enum RadioState { on, off }

class _ResponseEstadosState extends State<ResponseEstados> {
  late PermissionsController permissionsController;
  late LocationController locationController;
  late NotificationController notificationController;
  late LocationManager manager;

  @override
  void initState() {
    super.initState();
    permissionsController = Get.find();
    locationController = Get.find();
    notificationController = Get.find();
    manager = LocationManager();
  }

  @override
  Widget build(BuildContext context) {
    ArticlePoolService service = ArticlePoolService();
    Future<List<ArticleModel>> futureArticles = service.fecthData();
    return FutureBuilder<List<ArticleModel>>(
      future: futureArticles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              ArticleModel article = items[index];
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Image.network(article.thumbnail,
                    //  width: 160,
                    //),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.location_history),
                          onPressed: () async {
                            locationController.location.value = null;
                            if (permissionsController.locationGranted) {
                              final position =
                                  await manager.getCurrentLocation();
                              locationController.location.value = position;
                              notificationController.show(
                                  title: 'Tu ubicación es...',
                                  body:
                                      'Latitud ${position.latitude} - Longitud: ${position.longitude}');
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.location_on),
                          onPressed: locationController.location.value != null
                      ? () async {
                          final location = locationController.location.value;
                          final url =
                              "https://www.google.es/maps?q=${location?.latitude},${location?.longitude}";
                          await launch(url);
                        } : null,
                        ),
                        Text("Usuario:  ${article.byline}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Descripcion: ${article.title}"),
                        //separacion
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Ubicacion: ${article.subsection}",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ))
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
