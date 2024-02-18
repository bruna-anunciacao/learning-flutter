import 'package:flutter/material.dart';
import 'package:trying_geolocator_with_api/user_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: 'Geolocation App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Geolocation App'),
          ),
          body: Center(
            child: Text('Hello World!'),
          ),
        ),
        routes: {},
      ),
    );
  }
}
