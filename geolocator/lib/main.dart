import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geolocator_app/repositories/restaurant_repository.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(
    ChangeNotifierProvider<RestaurantRepository>(create:(_) => RestaurantRepository(),
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppWidget(),
    );
  }
}