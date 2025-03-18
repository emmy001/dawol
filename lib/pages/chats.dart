import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/calendar.dart';
import '../widgets/openChatOverlay.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  bool _isChatOverlayVisible = false; // State to manage overlay visibility

  void _toggleChatOverlay() {
    setState(() {
      _isChatOverlayVisible = !_isChatOverlayVisible; // Toggle visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(userName: 'Kajwang'), // Pass the user's name

                const Calendar(
                  selectedDate: 15,
                ), // Provide a value for selectedDate
                if (_isChatOverlayVisible)
                  ChatOverlay(), // Conditionally show overlay
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleChatOverlay, // Toggle overlay visibility
        backgroundColor: Colors.black, // Set background color
        child:
            _isChatOverlayVisible
                ? const Icon(
                  Icons.close,
                  color: Colors.white,
                ) // Change icon when overlay is visible
                : SvgPicture.asset(
                  'assets/images/startChat.svg', // Use your SVG file
                  width: 24,
                  height: 24,
                  color: Colors.white, // Optionally set a color for the SVG
                ),
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(), // Fixed at the bottom
    );
  }
}
