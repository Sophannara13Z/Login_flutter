import 'package:flutter/material.dart';
import 'package:project1/route/app_route.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo,
            const SizedBox(height: 30),
            _getStart(context),
          ],
        ),
      ),
    );
  }

  Widget get _logo {
    return Image.asset(
      'assets/images/logo.png',
      width: 180,
      height: 180,
      fit: BoxFit.contain,
    );
  }

  Widget _getStart(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(AppRoute.loginScreen);
      },
      child: Text(
        "Get Start",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
