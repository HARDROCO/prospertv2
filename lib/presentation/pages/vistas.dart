import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modulos/domain/use_case/controllers/theme_controller.dart';
import 'package:modulos/domain/use_case/theme_management.dart';
import 'package:modulos/presentation/pages/nav.dart';
import 'package:modulos/presentation/theme/theme.dart';

class VistaPpal extends StatefulWidget {
  const VistaPpal({Key? key}) : super(key: key);

  @override
  _VistaPpal createState() => _VistaPpal();
}

class _VistaPpal extends State<VistaPpal> {
  // Dependency injection: setting up state management
  late final ThemeController controller = Get.put(ThemeController());
  late final ThemeManager manager = ThemeManager();
  bool isLoaded = false;


  Future<void> initializeTheme() async {  
    controller.darkMode = await manager.storedTheme;
    setState(() => isLoaded = true);
  }
  
  @override
  void initState() {
    ever(controller.reactiveDarkMode, (bool isDarkMode) {
      manager.changeTheme(isDarkMode: isDarkMode);
    });
    initializeTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? const CircularProgressIndicator()
        : Container(
          child: Nav(),  
          );
  }
}
  
