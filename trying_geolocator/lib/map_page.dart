import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  double lat = -12.917076504275878;
  double long = -38.364644843876086;
  Set<Marker> markers = new Set<Marker>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: markers,
        initialCameraPosition:
            CameraPosition(target: LatLng(lat, long), zoom: 18),
      ),
    );
  }
}
