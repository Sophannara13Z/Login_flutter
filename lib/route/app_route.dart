import 'package:flutter/material.dart';
import 'package:project1/screene/login_screen.dart';
import 'package:project1/screene/main_screen.dart';
import 'package:project1/screene/otp_verify_screen.dart';
import 'package:project1/screene/phone_otp_screen.dart';
import 'package:project1/screene/register_screen.dart';
import 'package:project1/screene/splash_screen.dart';

// 👉 AppRoute
class AppRoute {
  static const String splashScreen = "";
  static const String loginScreen = "/loginScreen";
  static const String registerScreen = "/registerScreen";
  static const String mainScreen = "/mainScreen";
  static const String phoneScreen = "/phoneScreen";
  static const String otpScreen = "/otpScreen";

 static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
          return _buildRoute(routeSettings,SplashScreen());
      case loginScreen:
        return _buildRoute(routeSettings, LoginScreen());
      case registerScreen:
        return _buildRoute(routeSettings, RegisterScreen());
      case mainScreen:
        return _buildRoute(routeSettings, MainScreen());
      case phoneScreen:
        return _buildRoute(routeSettings, PhoneOTPScreen());
      case otpScreen:
        return _buildRoute(routeSettings, OTPVerifyScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("Route '${routeSettings.name}' not found."),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _buildRoute(
      RouteSettings routeSettings, Widget newRoute) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) => newRoute,
    );
  }
}

// 👉 Exception Class
