import 'package:geolocator/geolocator.dart';
import 'package:modulos/data/services/geolocation.dart';

class LocationManager {
  final gpsService = GpsService();

  Future<Position> getCurrentLocation() async {
    //retorna la posicion actual, 
    return await gpsService.getCurrentLocation();
  }
}
