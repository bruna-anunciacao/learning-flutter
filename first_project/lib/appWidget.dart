import 'package:flutter/material.dart';
import 'package:first_project/appController.dart';
import 'package:first_project/homePage.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: AppController.instance.isDark
                  ? Brightness.dark
                  : Brightness.light),
          home: HomePage(),
        );
      },
      animation: AppController.instance,
    );
  }
}
