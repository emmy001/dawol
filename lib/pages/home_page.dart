import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/welcome_section.dart';
import '../widgets/recent_orders_section.dart';
import '../widgets/search_section.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/calendar.dart';
import '../widgets/openChatOverlay.dart';
import '../widgets/floatingButton.dart';
import '../routes/app_routes.dart';

class HomeClientsPage extends StatelessWidget {
  const HomeClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(userName: 'Kajwang'), // Pass the user's name
            const WelcomeSection(),

            const SizedBox(width: 25),
            const RecentOrdersSection(),

            const SizedBox(width: 25),
            const SearchSection(),

            const SizedBox(width: 25),
            const Calendar(
              selectedDate: 15,
            ), // Provide a value for selectedDate

            const SizedBox(width: 25),
            ChatOverlay(),

            const SizedBox(width: 25),
            Fab(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.chats);
              },
              imagePath: 'assets/images/start.svg',
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(), // Fixed at the bottom
    );
  }
}
