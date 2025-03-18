import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/calendar.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(userName: 'Kajwang'), // Pass the user's name
            const Calendar(
              selectedDate: 15,
            ), // Provide a value for selectedDate
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(), // Fixed at the bottom
    );
  }
}
