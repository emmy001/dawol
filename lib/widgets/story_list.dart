import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  final List<Map<String, String>> recentChats = List.generate(
    10,
    (index) => {
      "name": "User $index",
      "imageUrl":
          "https://placehold.co/77x77", // Replace with actual image URLs
    },
  );

  StoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ), // Added margin
      padding: const EdgeInsets.symmetric(vertical: 5), // Optional padding
      height: 100, // Slightly increased height for better spacing
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            recentChats.length,
            (index) => Padding(
              padding: const EdgeInsets.only(
                right: 10,
              ), // Increased spacing between avatars
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 38.5,
                    backgroundImage: NetworkImage(
                      recentChats[index]["imageUrl"]!,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    recentChats[index]["name"]!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
