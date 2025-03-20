import 'package:flutter/material.dart';
import '../../widgets/story_list.dart';
import '../../widgets/chat_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const Chats2());
}

class Chats2 extends StatelessWidget {
  const Chats2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(body: MessagesScreen()),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            height: 88,
            color: const Color(0xFFEEEEEE),
            padding: const EdgeInsets.only(left: 15, right: 15, top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Messages',
                  style: TextStyle(
                    color: Color(0xFF343434),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/search2.svg', // Path to your SVG file
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // Story List Section
          StoryList(),

          const SizedBox(height: 22),

          // Chats Header Section (with SVG icon)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Align text & icon
              children: [
                Row(
                  children: [
                    Text(
                      'Chats',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.48,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8), // Spacing between text and icon
                    SvgPicture.asset(
                      'assets/icons/more.svg', // Your SVG icon
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Expanded ListView Section
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder:
                  (context, index) => const ChatItem(
                    name: "Almond Steve",
                    message: "Hello, where are you at?",
                    time: "13:00",
                    imageUrl: "https://placehold.co/63x63",
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
