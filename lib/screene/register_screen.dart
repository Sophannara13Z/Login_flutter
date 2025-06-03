import 'package:flutter/material.dart';
import 'package:project1/data/user_share_prefereces.dart';
import 'package:project1/route/app_route.dart';
import 'package:project1/screene/login_screen.dart';
// Make sure this import points to your PhoneOTPScreen file
import 'package:project1/screene/phone_otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscure = true;
  bool _isValidEmail = false;
  final _resgisterFormKey = GlobalKey<FormState>();
  final TextEditingController _createEmailController = TextEditingController();
  final TextEditingController _createusernameController =
      TextEditingController();
  final TextEditingController _createpasswordController =
      TextEditingController();
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
        "Register",
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
        child: Form(
          key: _resgisterFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _logo,
              const SizedBox(height: 30),
              _createGmailField,
              const SizedBox(height: 20),
              _usernameField,
              const SizedBox(height: 20),
              _passwordField,
              const SizedBox(height: 30),
              _registerButton,
              const SizedBox(height: 40),
              const Text("Or Register With"),
              const SizedBox(height: 10),
              _socialLoginButtons,
              const SizedBox(height: 30),
              _alreadyHaveAccountLink,
            ],
          ),
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
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a username';
        }
        return null;
      },
      controller: _createusernameController,
      onChanged: (value) {
        setState(() {
          _isValidEmail = value.contains("@");
        });
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person_outline),
          // suffixIcon: _isValidEmail
          //     ? const Icon(Icons.check_circle, color: Colors.green)
          //     : null,
          labelText: 'Username ',
          border: const OutlineInputBorder()),
    );
  }

  Widget get _createGmailField {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a email';
        }
        return null;
      },
      controller: _createEmailController,
      onChanged: (value) {
        setState(() {
          _isValidEmail = value.contains("@");
        });
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person_outline),
          suffixIcon: _isValidEmail
              ? const Icon(Icons.check_circle, color: Colors.green)
              : null,
          labelText: 'Email',
          border: const OutlineInputBorder()),
    );
  }

  Widget get _passwordField {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      controller: _createpasswordController,
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

  Widget get _registerButton {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
          onPressed: _performRegistration,
          child: const Text(
            "Register",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
    );
  }

  void _performRegistration() {
    // String createusername = _createusernameController.text.trim();
    // String creategmail = _createEmailController.text.trim();
    // String createpassword = _createpasswordController.text.trim();
    if (_resgisterFormKey.currentState?.validate() == true) {
      // Process call API to backend

      String createusername = _createusernameController.text;
      String creategmail = _createEmailController.text;
      String createpassword = _createpasswordController.text;

      print('Username: $createusername');
      print('Email: $creategmail');
      print('Password: $createpassword');

      UserSharedPreference.register(
          createusername, creategmail, createpassword);
      AppRoute.key.currentState?.pushNamed(AppRoute.mainScreen);
    } else {
      final alertDialog = AlertDialog(
        title: Icon(Icons.error, color: Colors.red, size: 80),
        content: Text("Please fill all fields correctly"),
      );
      showDialog(context: context, builder: (context) => alertDialog);
    }
  }

  Widget get _socialLoginButtons {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              print("Google register tapped");
            },
            icon: Image.asset(
              'assets/images/google.png',
              width: 35,
              height: 35,
            )),
        const SizedBox(width: 20),
        IconButton(
            onPressed: () {
              print("Facebook register tapped");
            },
            icon: Image.asset(
              'assets/images/facebook.png',
              width: 35,
              height: 35,
            )),
      ],
    );
  }

  Widget get _alreadyHaveAccountLink {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        TextButton(
            onPressed: _navigateToLogin,
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  void _navigateToLogin() {
    AppRoute.key.currentState?.pushNamed(AppRoute.loginScreen);
  }
}
