import 'package:get/get.dart';
import 'package:modulos/domain/models/states.dart';

class StateController extends GetxController {
  var listStates = [].obs;
  //lista observable para que getx nos permita ver si cambia de estado
  //para actualizarla en el widget, observable

  //metodo para añadir obj a la lista
  void addState(usuario, descripcion, ubicacion) {
    var state = State(
      usuario: usuario,
      descripcion: descripcion,
      ubicacion: ubicacion,
    );

    listStates.add(state);
    print(listStates[0].usuario);
    print(listStates[0].descripcion);
    print(listStates[0].ubicacion);
  }
}
