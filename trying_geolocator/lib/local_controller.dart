import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String error = '';
  late GoogleMapController _mapsController;
  late Timer _locationUpdateTimer;

  get mapsController => _mapsController;
  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    initializeLocationUpdate();
  }

  initializeLocationUpdate() {
    getPosition();
    _locationUpdateTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      Get.snackbar('Google Maps:', 'Localização atualizada com sucesso.',
          colorText: Colors.white, backgroundColor: Colors.purple);
      getPosition();
    });
  }

  getPosition() async {
    try {
      Position position = await _actualPosition();
      lat = position.latitude;
      long = position.longitude;
      _mapsController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
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
