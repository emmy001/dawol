import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/input_fields.dart';
import '../widgets/button.dart';
import '../providers/auth_providers.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _signUp() async {
    // Check if passwords match
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match.")));
      return; // Stop execution if passwords don't match
    }

    // Proceed with signup if passwords match
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    bool success = await authProvider.signUp(
      _emailController.text,
      _passwordController.text,
    );

    if (success) {
      // Navigate to the Profile Completion page with the userId
      GoRouter.of(context).go('/profile-completion/${authProvider.userId}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Signup failed. Try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.asset(
                    "assets/images/signup_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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

                      InputFields(
                        controller: _emailController,
                        hintText: 'Email',
                      ),

                      const SizedBox(height: 20),

                      InputFields(
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 20),

                      InputFields(
                        controller: _confirmPasswordController,
                        hintText: 'Confirm Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 30),

                      Center(
                        child: CustomButton(
                          text: 'SignUp',
                          onPressed:
                              _signUp, // Connected to authentication logic
                        ),
                      ),

                      const SizedBox(height: 20),

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
                                GoRouter.of(context).push('/login');
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
