import 'package:flutter/material.dart';
import 'package:project1/route/app_route.dart'; // Adjust path if needed

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       initialRoute: AppRoute.splashScreen,
      onGenerateRoute: AppRoute.onGenerateRoute,
      navigatorKey: AppRoute.key, // Use your route generator
    );
  }
}