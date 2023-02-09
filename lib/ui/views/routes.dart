import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/ui/views/home/home_view.dart';
import 'package:pokemon/ui/views/splash/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Uri _uriData = Uri.parse(settings.name ?? "");

    final args = settings.arguments;

    switch (_uriData.path) {
      case SplashView.route:
        return MaterialPageRoute(builder: (_) => SplashView());
      case HomeView.route:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return CupertinoPageRoute(builder: (_) => SplashView());
    }
  }
}
