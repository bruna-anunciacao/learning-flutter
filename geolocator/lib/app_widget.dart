import 'package:flutter/material.dart';
import 'package:geolocator_app/restaurant_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Meu local')),
          backgroundColor: Colors.deepPurple,
        ),
        body: ChangeNotifierProvider<RestaurantController>(
          create: (context) => RestaurantController(),
          child: Builder(builder: (context) {
            final local = context.watch<RestaurantController>();
            return GoogleMap(
                initialCameraPosition: CameraPosition(
              target: LatLng(local.lat, local.long),
              zoom: 18,
            ));
          }),
        ));
  }
}
