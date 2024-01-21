import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocalController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';
  LocalController() {
    getPosition();
  }
  getPosition() async {
    try {
      Position position = await _actualPosition();
      lat = position.latitude;
      long = position.longitude;
    } catch (err) {
      error = err.toString();
    }
    notifyListeners();
  }

  Future<Position> _actualPosition() async {
    LocationPermission permission;
    bool active = await Geolocator.isLocationServiceEnabled();
    if (!active) {
      return Future.error("Por favor, habilite a localização");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
