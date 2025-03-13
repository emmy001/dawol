import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String userName; // Add a parameter for the user's name

  const CustomAppBar({super.key, required this.userName});

  // Helper function to determine the greeting based on the time of day
  String _getGreeting() {
    final hour = DateTime.now().hour; // Get the current hour (0-23)

    switch (hour) {
      case >= 5 && < 12: // Morning: 5 AM to 11:59 AM
        return 'Good Morning,';
      case >= 12 && < 17: // Afternoon: 12 PM to 4:59 PM
        return 'Good Afternoon,';
      default: // Evening: 5 PM to 4:59 AM
        return 'Good Evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: const BoxDecoration(color: Color(0xFFEEEEEE)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dynamic Greeting with User's Name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _getGreeting(), // Call the helper function
                style: const TextStyle(
                  color: Color(0xFF343434),
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4), // Spacing between greeting and name
              Text(
                userName, // Display the user's name
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17.42,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          // Optional Actions (e.g., Icons or Buttons)
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {
                  // Handle notification icon press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
