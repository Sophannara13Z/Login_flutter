import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart'; // Ensure you have this in pubspec.yaml
import 'package:project1/screene/main_screen.dart';
// If you need to navigate back to PhoneOTPScreen
// import 'package:project1/screene/phone_otp_screen.dart';

class OTPVerifyScreen extends StatefulWidget {
  final String username; // MODIFIED: To accept username

  const OTPVerifyScreen({super.key, required this.username}); // MODIFIED: Constructor

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  final TextEditingController _otpController = TextEditingController(); // For Pinput

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

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
        "Verify OTP",
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
          //   // Fallback to PhoneOTPScreen if needed, passing username back
          //   Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(builder: (context) => PhoneOTPScreen(username: widget.username)),
          //   );
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
            Text( // MODIFIED: Display for whom OTP is being verified
              "Enter OTP sent for user:",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              widget.username,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent[700]),
            ),
            const SizedBox(height: 30),
            _otpVerifyField(), // Use the configured Pinput
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
      width: 150,
      height: 150,
      fit: BoxFit.contain,
    );
  }

  Widget _otpVerifyField() { // MODIFIED: Configured Pinput
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(200, 200, 200, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.blueAccent, width: 2.0),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      controller: _otpController,
      length: 6, // Adjust as needed
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      // validator: (s) {
      //   return s == '222222' ? null : 'Pin is incorrect'; // Example validation
      // },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) {
        print("OTP Entered: $pin");
        // Optionally, you could call _performOtpVerification here
      },
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
          onPressed: _performOtpVerification, // Renamed method
          child: const Text(
            "Verify OTP", // Updated text
            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          )),
    );
  }

  void _performOtpVerification() { // Renamed from _performPhoneRegistration
    String otp = _otpController.text.trim();

    // TODO: Implement actual OTP verification logic here
    print('Verifying OTP: $otp for user: ${widget.username}');
    bool isOtpValid = true; // Replace with actual validation

    if (isOtpValid) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(username: widget.username), // MODIFIED HERE
          ),
      );
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }
}