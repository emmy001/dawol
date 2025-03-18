import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/input_fields.dart'; // Import the InputFields widget
import '../../widgets/button.dart'; // Import the Button widget
import '../providers/auth_providers.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    bool success = await authProvider.login(
      _emailController.text,
      _passwordController.text,
    );

    if (success) {
      GoRouter.of(context).go('/home'); // ✅ Redirect to home using GoRouter
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login failed. Check your credentials.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light gray background
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove shadow
        automaticallyImplyLeading: false, // Remove back button
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
                      // Login Title
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
                      InputFields(
                        controller: _emailController,
                        hintText: 'Username',
                      ),

                      const SizedBox(height: 20),

                      // Password Input Field
                      InputFields(
                        hintText: 'Password',
                        obscureText: true,
                        controller: _passwordController,
                      ),

                      const SizedBox(height: 10),

                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            debugPrint('Forgot Password tapped');
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF767573),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Login Button
                      Center(
                        child: CustomButton(onPressed: _login, text: 'Login'),
                      ),

                      const SizedBox(height: 20),

                      // Create Account Link
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don’t have an account? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(
                                  '/signup',
                                ); // Use the route path defined in `appRouter`
                              },
                              child: const Text(
                                'Create account',
                                style: TextStyle(
                                  color: Color(0xFF777573),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
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
