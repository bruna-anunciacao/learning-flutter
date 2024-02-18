import 'package:flutter/material.dart';
import 'package:trying_geolocator_with_api/user.dart';

class UserProvider extends InheritedWidget {
  final Widget child;
  List<User> users = [];

  UserProvider({
    required this.child,
  }) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
