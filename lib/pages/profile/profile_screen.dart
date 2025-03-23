import 'package:flutter/material.dart';
import 'package:dawol/services/user_service.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  final String userId;

  const ProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    // Create an instance of UserService
    final UserService userService = UserService();

    return FutureBuilder<Map<String, dynamic>>(
      // Call the non-static method on the instance
      future: userService.getUserDetails(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No data found'));
        }

        final userData = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text('Profile')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Full Name: ${userData['full_name'] ?? 'N/A'}'),
                Text('Username: ${userData['username'] ?? 'N/A'}'),
                Text('Email: ${userData['email'] ?? 'N/A'}'),
                Text('Phone: ${userData['phone'] ?? 'N/A'}'),
                Text('Gender: ${userData['gender'] ?? 'N/A'}'),
                Text('City: ${userData['location']?['city'] ?? 'N/A'}'),
                Text('Country: ${userData['location']?['country'] ?? 'N/A'}'),
                ElevatedButton(
                  onPressed: () {
                    context.go('/edit-profile', extra: userId);
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
