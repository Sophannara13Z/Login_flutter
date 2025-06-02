import 'package:flutter/material.dart';
import 'package:project1/route/app_route.dart';
// Make sure this import points to your OTPVerifyScreen file
import 'package:project1/screene/otp_verify_screen.dart';
// If you need to navigate back to LoginScreen or RegisterScreen in some edge cases
// import 'package:project1/screene/login_screen.dart';

class PhoneOTPScreen extends StatefulWidget {
// MODIFIED: Constructor

  @override
  State<PhoneOTPScreen> createState() => _PhoneOTPScreenState();
}

class _PhoneOTPScreenState extends State<PhoneOTPScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Phone Verify", // Updated title
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black54),
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          // else {
          //   // Fallback, e.g., to LoginScreen if stack is empty
          //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          // }
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _logo,
            const SizedBox(height: 30), 
           
            const SizedBox(height: 30),
            _phoneNumberField,
            const SizedBox(height: 40),
            _submitButton(context),
          ],
        ),
      ),
    );
  }

 Widget get _logo {
    return Image.asset(
      'assets/images/logo.png',
      width: 150, // Slightly smaller
      height: 150,
      fit: BoxFit.contain,
    );
  }

  Widget get _phoneNumberField {
    return TextField(
      controller: _phoneNumberController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone_android_outlined, color: Colors.grey), // Changed icon
        hintText: '(855 0123456789)', // Generic hint
        hintStyle: TextStyle(color: Colors.grey.shade400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder( // Added focused border
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 2,
            ),
          onPressed: _performPhoneRegistration,
          child: const Text(
            "Send OTP", // Updated text
            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          )),
    );
  }

  void _performPhoneRegistration() {
    String phoneNumber = _phoneNumberController.text.trim();

    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your phone number.')),
      );
      return;
    }else{
     AppRoute.key.currentState?.pushNamed(AppRoute.otpScreen);
    }
    // Add more robust phone number validation if needed



    // TODO: Implement actual OTP sending logic here

    
  }
}