import 'package:flutter/material.dart';
import 'package:dawol/widgets/profile_card.dart';
import 'package:dawol/widgets/app_bar.dart'; // Import custom AppBar
import 'package:dawol/widgets/bottom_navigation_bar.dart'; // Import custom Bottom Navigation

class Menu extends StatelessWidget {
  const Menu({super.key});

  final List<Map<String, dynamic>> profiles = const [
    {
      'name': 'Bitchie Maureen',
      'nationality': 'Canada',
      'status': 'Online',
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/f/f2/6990634-panda-hug.jpg',
      'rating': 4.5,
      'bio': '@Loves adventure, photography, and music.',
    },
    {
      'name': 'Alexie Scoold',
      'nationality': 'Brazil',
      'status': 'Online',
      'imageUrl':
          'https://media.istockphoto.com/id/1758173843/photo/a-fast-running-cheetah-taking-a-turn-to-the-left-from-the-front.jpg?s=2048x2048&w=is&k=20&c=vRBlvdLrP9NBJ786eOkRv40ZRVZvTaRybN9HgqDqXeo=',
      'rating': 3.8,
      'bio': '@Loves hiking, traveling, and exploring new cultures.',
    },
    {
      'name': 'Jumanjee Sophy',
      'nationality': 'Nigeria',
      'status': 'Online',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSgbxxuvgej9BpmIOVBcMr9Nmn6cRyYXGCYujlF-SvAlonEEb6s22B_PUPQCxCEQ54XDsBD4GBR0eLdGmbGOnVzD9Igu3jeAzoP7H4vGOv4HQwwF1szLo2qog&usqp=CAc',
      'rating': 4.2,
      'bio': '@Foodie, chef, and lover of spicy dishes.',
    },
    {
      'name': 'Stacey Weathers',
      'nationality': 'Kenya',
      'status': 'Offline',
      'imageUrl':
          'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQZbsGdCymJtH-M5vZ3seGpgzs2BqCYeuC_WW1W7ER7Z4wcl5CaLbwjEamOIalTeHK8msnPgl6qr5NuW0h3dV1iNL-UcdEkSGSrsJvtzOgwYQ5MS-RoRjLQkA&usqp=CAc',
      'rating': 2.5,
      'bio': '@Artist, painter, and nature enthusiast.',
    },
  ];

  /// Function to determine status color
  Color getStatusColor(String status) =>
      status == 'Online' ? const Color(0xFF5CCE7C) : const Color(0xFFFF0000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(userName: 'Menu'), // Use custom AppBar
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return ProfileCard(
            name: profile['name'],
            nationality: profile['nationality'],
            status: profile['status'],
            statusColor: getStatusColor(profile['status']),
            imageUrl: profile['imageUrl'],
            rating: profile['rating'],
            bio: profile['bio'],
          );
        },
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(), // Use custom Bottom Navigation
    );
  }
}
