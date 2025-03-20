import 'package:flutter/material.dart';
import 'package:dawol/services/user_service.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  final String userId;

  ProfileScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: UserService.getUserDetails(userId),
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
                Text('Full Name: ${userData['full_name']}'),
                Text('Username: ${userData['username']}'),
                Text('Email: ${userData['email']}'),
                Text('Phone: ${userData['phone']}'),
                Text('Gender: ${userData['gender']}'),
                Text('City: ${userData['location']['city']}'),
                Text('Country: ${userData['location']['country']}'),
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
