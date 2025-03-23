import 'package:flutter/material.dart';
import 'package:dawol/services/user_service.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  const EditProfileScreen({super.key, required this.userData});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserService _userService = UserService(); // Create an instance

  Future<void> _updateProfile() async {
    try {
      final updatedData = {
        'full_name': 'New Name', // Example updated data
        'phone': '1234567890', // Example updated data
      };

      // Call the method on the instance
      final response = await _userService.updateUserProfile(
        widget.userData['userId'], // Pass the userId
        updatedData,
      );

      print("✅ Profile updated: $response");
    } catch (e) {
      print("❌ Error updating profile: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: _updateProfile,
          child: const Text('Update Profile'),
        ),
      ),
    );
  }
}
