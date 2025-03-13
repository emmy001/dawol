import 'package:flutter/material.dart';
import 'routes/app_routes.dart'; // Import the AppRoutes
import 'widgets/input_fields.dart'; // Import the InputFields widget
import 'widgets/button.dart'; // Import the Button widget

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF5F5F5,
      ), // Light gray background for contrast
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove shadow
        automaticallyImplyLeading: false, // Remove back button
        title: null, // Remove title
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity, // Full width of the screen
            constraints: const BoxConstraints(
              maxWidth: 400,
            ), // Max width for larger screens
            child: Column(
              children: [
                // Logo/Image (Centered)
                SizedBox(
                  width: double.infinity,
                  height: 240, // Fixed height for the image
                  child: Image.asset(
                    "assets/images/signup_image.png",
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 10),

                // White Container covering Signup title, input fields, and button
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Keep Signup left-aligned
                    children: [
                      // Signup Title (Left-Aligned)
                      const Text(
                        'Signup',
                        style: TextStyle(
                          color: Color(0xFF343434),
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Username Input Field
                      const InputFields(hintText: 'Username'),

                      const SizedBox(height: 20),

                      // Password Input Field
                      const InputFields(
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 20),

                      // Confirm Password Input Field
                      const InputFields(
                        hintText: 'Confirm Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 30),

                      // SignUp Button (Centered)
                      const Center(child: CustomButton(text: 'SignUp')),

                      const SizedBox(height: 20),

                      // Create Account Link (Centered)
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0.67,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.login,
                                ); // Use named route
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Color(0xFF777573),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 0.67,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
