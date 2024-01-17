import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class RestaurantController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';
  RestaurantController() {
    getPosition();
  }
  getPosition() async {
    try {
      Position position = await _actualPosition();
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      error = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _actualPosition() async {
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      error = 'Serviço de localização desabilitado';
      notifyListeners();
      return Future.error('Serviço de localização desabilitado');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        error = 'Permissão de localização negada';
        notifyListeners();
        return Future.error('Permissão de localização negada');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      error = 'Permissão de localização negada - solicite novamente';
      notifyListeners();
      return Future.error(
          'Permissão de localização negada - solicite novamente');
    }
    return await Geolocator.getCurrentPosition();
  }
}
