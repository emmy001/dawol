import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatOverlay extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {
      'svgPath': 'assets/images/chat.svg',
      'title': 'New Chat',
      'subtitle': 'Send a message to your contact',
      'onTap': () => print("New Chat Clicked"),
    },
    {
      'svgPath': 'assets/images/contact.svg',
      'title': 'New Contact',
      'subtitle': 'Add a contact to be able to send messages',
      'onTap': () => print("New Contact Clicked"),
    },
    {
      'svgPath': 'assets/images/community.svg',
      'title': 'New Community',
      'subtitle': 'Join the community around you',
      'onTap': () => print("New Community Clicked"),
    },
  ];

  ChatOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: options.map((option) => _buildOption(option)).toList(),
      ),
    );
  }

  Widget _buildOption(Map<String, dynamic> option) {
    return GestureDetector(
      onTap: option['onTap'], // Individual onTap function
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              option['svgPath'],
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option['title'],
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    option['subtitle'],
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
