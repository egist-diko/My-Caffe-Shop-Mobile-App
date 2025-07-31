import 'package:dev_app/ui/screens/homeScreen.dart';
import 'package:dev_app/ui/screens/mainScreen.dart';
import 'package:dev_app/ui/screens/onBoardingScreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String homeScreen = '/homeScreen';
  static const String mainScreen = '/mainScreen';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      homeScreen: (context) => HomeScreen(),
      onBoardingScreen: (context) => OnBoardingScreen(),
    };
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => MainScreen(coffeCardProps: args?['mainScreenProps']),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Page not found')),
            body: Center(child: Text('Unknown route: ${settings.name}')),
          ),
          settings: settings,
        );
    }
  }
}
