import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  // Function to navigate to a new screen
  static Future<dynamic> navigateTo(String routeName, Object? arguments) async {
    if (navigator != null) {
      return navigator!.pushNamed(routeName, arguments: arguments);
    } else {
      // Handle the case when navigator is null, return an appropriate value
      return Future.value(
          null); // Or throw an error, depending on your use case
    }
  }

  // Function to go back and return a Future<bool> to match the return type
  static Future<bool> goBack() async {
    if (navigator != null) {
      navigator!.pop();
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
