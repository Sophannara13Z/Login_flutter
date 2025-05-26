import 'package:flutter/material.dart';
// Make sure this import points to your PhoneOTPScreen file
import 'package:project1/screene/phone_otp_screen.dart';
import 'package:project1/screene/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        "Login",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
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
            _usernameField,
            const SizedBox(height: 20),
            _passwordField,
            const SizedBox(height: 10),
            _forgotPasswordLink,
            const SizedBox(height: 20),
            _loginButton,
            const SizedBox(height: 40),
            const Text("Or Login With"),
            const SizedBox(height: 10),
            _socialLoginButtons,
            const SizedBox(height: 30),
            _dontHaveAccountLink,
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

  Widget get _usernameField {
    return TextField(
      controller: _usernameController,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person_outline),
          labelText: 'Username or Email',
          border: OutlineInputBorder()),
    );
  }

  Widget get _passwordField {
    return TextField(
      controller: _passwordController,
      obscureText: _isObscure,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_outline),
        labelText: 'Password',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
    );
  }

  Widget get _loginButton {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
          onPressed: _performLogin,
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }

  void _performLogin() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both username and password.')),
      );
      return;
    }

    print('Attempting to login:');
    print('Username: $username');
    print('Password: $password');

    // Navigate after successful login attempt
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PhoneOTPScreen(username: username), // MODIFIED HERE
        ),
    );
  }

  Widget get _forgotPasswordLink {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              print("Forgot password tapped");
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
  }

  Widget get _socialLoginButtons {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              print("Google login tapped");
            },
            icon: Image.asset(
              'assets/images/google.png',
              width: 35,
              height: 35,
            )),
        const SizedBox(width: 20),
        IconButton(
            onPressed: () {
              print("Facebook login tapped");
            },
            icon: Image.asset(
              'assets/images/facebook.png',
              width: 35,
              height: 35,
            )),
      ],
    );
  }

  Widget get _dontHaveAccountLink {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
            onPressed: _navigateToRegister,
            child: const Text(
              'Register',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  void _navigateToRegister() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }
}