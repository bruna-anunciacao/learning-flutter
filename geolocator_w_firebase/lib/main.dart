import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: FireMap()),
    );
  }
}

class FireMap extends StatefulWidget {
  @override
  State createState() => FireMapState();
}

class FireMapState extends State<FireMap> {
  Location location = Location();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();

  late GoogleMapController mapController;
  late LatLng lastMapPosition;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _animateToUser();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(24.150, -110.32), zoom: 10),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          mapType: MapType.hybrid,
          markers: Set<Marker>.of(markers),
          onCameraMove: _onCameraMove,
        ),
        Positioned(
          bottom: 50,
          right: 10,
          child: ElevatedButton(
            child: Icon(Icons.pin_drop),
            onPressed: () => _addMarker(),
          ),
        ),
        Positioned(
          bottom: 120,
          right: 10,
          child: ElevatedButton(
            child: Icon(Icons.location_searching),
            onPressed: () => _animateToUser(),
          ),
        ),
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  void _addMarker() {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(markers.length.toString()),
          position: lastMapPosition,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Magic Marker', snippet: '🍄🍄🍄'),
        ),
      );
    });
  }

  Future<void> _animateToUser() async {
    try {
      var pos = await location.getLocation();
      if (pos != null) {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(pos.latitude!, pos.longitude!),
              zoom: 17.0,
            ),
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<DocumentReference> _addGeoPoint() async {
    try {
      var pos = await location.getLocation();
      if (pos != null) {
        GeoFirePoint point =
            geo.point(latitude: pos.latitude!, longitude: pos.longitude!);
        return firestore.collection('locations').add({
          'position': point.data,
          'name': 'Yay I can be queried!'
        });
      } else {
        throw Exception("Unable to get location");
      }
    } catch (e) {
      print("Error adding geo point: $e");
      rethrow; // Rethrow the error for handling higher up the call stack
    }
  }
}
