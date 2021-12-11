import 'package:get/get.dart';

// clase controladora de los textbox en las paginas que los usan

class TextController extends GetxController {
  // Using Rx<> for custom class reactivity
  var _txtbox = RxString("");

  // build a controller for the textbox
  TextController() {
    // listen to changes in the textbox
    _txtbox.listen((value) {
      // update the textbox
      update();
    });
  }

  // getter for the textbox
  String get txtbox => _txtbox.value;

  // setter for the textbox
  set txtbox(String value) => _txtbox.value = value;

  // clear the textbox
  void clear() => _txtbox.value = "";
}



