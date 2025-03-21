import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dawol/providers/user_provider.dart';
import 'package:go_router/go_router.dart';

class ProfileCompletionScreen extends StatefulWidget {
  final String userId;

  const ProfileCompletionScreen({super.key, required this.userId});

  @override
  _ProfileCompletionScreenState createState() =>
      _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState extends State<ProfileCompletionScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  void _completeProfile() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    bool success = await userProvider.completeProfile(
      userId: widget.userId,
      profileData: {
        'full_name': _fullNameController.text,
        'username': _usernameController.text,
        'phone': _phoneController.text,
        'gender': _genderController.text,
        'dob': _dobController.text,
        // Add other fields as needed
      },
    );

    if (success) {
      GoRouter.of(context).go('/home'); // Navigate to the home page
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to complete profile.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complete Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _genderController,
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              controller: _dobController,
              decoration: const InputDecoration(labelText: 'Date of Birth'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _completeProfile,
              child: const Text('Complete Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
