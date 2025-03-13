import 'package:flutter/material.dart';
import 'routes/app_routes.dart'; // Import the AppRoutes
import '../widgets/input_fields.dart'; // Import the InputFields widget
import '../widgets/button.dart'; // Import the Button widget

class Login extends StatelessWidget {
  const Login({super.key});

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
                  height: 250, // Fixed height for the image
                  child: Image.asset(
                    "assets/images/login_image.png",
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 25),

                // White Container covering Login title, input fields, and button
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
                        CrossAxisAlignment.start, // Keep Login left-aligned
                    children: [
                      // Login Title (Left-Aligned)
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF343434),
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.50,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Username Input Field
                      const InputFields(hintText: 'Username'),

                      const SizedBox(height: 20),

                      // Password Input Field
                      const InputFields(
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      // Forgot Password Link (Right-Aligned)
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            print('Forgot Password tapped');
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF767573),
                              fontSize: 9,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0.67,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Login Button (Centered)
                      const Center(child: CustomButton(text: 'Login')),

                      const SizedBox(height: 20),

                      // Create Account Link (Centered)
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don’t have an account? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0.67,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.signup,
                                ); // Use named route
                              },
                              child: const Text(
                                'Create account',
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
