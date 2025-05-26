import 'package:flutter/material.dart';
// If you want a logout button to go back to LoginScreen
// import 'package:project1/screene/login_screen.dart';

class MainScreen extends StatefulWidget {
  final String username; // MODIFIED: To accept username

  const MainScreen({super.key, required this.username}); // MODIFIED: Constructor

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar,
      body: _body,
    );
  }

  PreferredSizeWidget get _appBar {
    return AppBar(
      title: const Text(
        "Home Page",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      // Example Logout Button
      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.logout, color: Colors.black54),
      //     onPressed: () {
      //       Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (context) => const LoginScreen()),
      //         (Route<dynamic> route) => false,
      //       );
      //     },
      //   ),
      // ],
    );
  }

  Widget get _body {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _logo,
            const SizedBox(height: 30),
            Text( // MODIFIED HERE: Display the username
              "Hi ${widget.username}!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 26, // Slightly larger
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            const SizedBox(height: 15),
            const Text(
              "Welcome to your dashboard.",
               textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            )
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
}