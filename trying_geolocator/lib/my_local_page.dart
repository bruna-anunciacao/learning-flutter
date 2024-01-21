import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trying_geolocator/local_controller.dart';

class MyLocalPage extends StatefulWidget {
  const MyLocalPage({super.key});

  @override
  State<MyLocalPage> createState() => _MyLocalPageState();
}

class _MyLocalPageState extends State<MyLocalPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu local"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ChangeNotifierProvider<LocalController>(
          create: (context) => LocalController(),
          child: Builder(builder: (context) {
            final local = context.watch<LocalController>();
            double latitude = local.lat;
            double longitude = local.long;
            return GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  CameraPosition(target: LatLng(latitude, longitude), zoom: 18),
              zoomControlsEnabled: true,
              mapType: MapType.normal,
            );
          })),
    );
  }
}
