import 'package:flutter/material.dart';
import 'package:project1/screene/login_screen.dart';

void main() {
  final app = App();
  runApp(app);
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
    );
  }
}
