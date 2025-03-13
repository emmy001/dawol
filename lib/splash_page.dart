import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart'; // Import your login page

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Navigate to Login Page after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ), // Replace with your Login screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Background Image
              Expanded(
                child: Image.asset(
                  "assets/images/splash_image.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),

              // Footer Text (Always Centered)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Crafted with love ❤️ and Kajwang',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    color: const Color(0xFFCECECE),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1.33,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
