import 'package:flutter/material.dart';
import 'splash_page.dart'; // Import the Splash page
import 'routes/app_routes.dart'; // Import the AppRoutes
import 'login.dart'; // Import the Login screen
import 'signup.dart'; // Import the SignUp screen

void main() {
  runApp(const DawolApp());
}

class DawolApp extends StatelessWidget {
  const DawolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      initialRoute: AppRoutes.login, // Set the initial route
      routes: {
        AppRoutes.login: (context) => const Login(), // Define the Login route
        AppRoutes.signup:
            (context) => const SignUp(), // Define the SignUp route
      },
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Splash(), // Use const Splash()
    );
  }
}
