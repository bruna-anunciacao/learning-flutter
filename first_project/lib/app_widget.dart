import 'package:first_project/home_page.dart';
import 'package:first_project/login_page.dart';
import 'package:flutter/material.dart';
import 'package:first_project/app_controller.dart';

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
          initialRoute: '/',
          routes: {
            '/':(context) => LoginPage(),
            '/home':(context) => HomePage(),
          },
        );
      },
      animation: AppController.instance,
    );
  }
}
