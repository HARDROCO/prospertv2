import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/presentation/pages/screen/gps_screen.dart';
import 'package:modulos/presentation/widgets/appbar_default.dart';

class GpsPage extends StatelessWidget {
  final ThemeController controller = Get.find();
  GpsPage({Key? key}) : super(key: key);

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Mi Ubicacion",
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: GpsScreen(),
        ),
      ),
    );
  }
}
