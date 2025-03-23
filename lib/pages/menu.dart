import 'package:flutter/material.dart';
import 'package:dawol/widgets/profile_card.dart';
import 'package:dawol/widgets/app_bar.dart'; // Import custom AppBar
import 'package:dawol/widgets/bottom_navigation_bar.dart'; // Import custom Bottom Navigation
import 'package:dawol/widgets/search_bar.dart'; // Import Search Bar Widget
import 'package:dawol/services/user_service.dart'; // Import UserService

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> profiles = [];
  List<Map<String, dynamic>> filteredProfiles = [];
  bool isLoading = true; // Track loading state

  @override
  void initState() {
    super.initState();
    _fetchAllUsers(); // Fetch all users when the widget initializes
  }

  /// Fetch all users from the backend
  Future<void> _fetchAllUsers() async {
    try {
      final userService = UserService();
      final users = await userService.getAllUsers();

      // Update the UI
      setState(() {
        profiles = users;
        filteredProfiles = users;
        isLoading = false; // Set loading to false after fetching data
      });
    } catch (e) {
      print("❌ Error fetching all users: $e");
      setState(() {
        isLoading = false; // Set loading to false even if there's an error
      });
    }
  }

  /// Function to filter profiles based on search input
  void _filterProfiles(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProfiles = profiles;
      } else {
        filteredProfiles =
            profiles
                .where(
                  (profile) =>
                      profile['full_name'].toLowerCase().contains(
                        query.toLowerCase(),
                      ) ||
                      profile['location']['country'].toLowerCase().contains(
                        query.toLowerCase(),
                      ),
                )
                .toList();
      }
    });
  }

  /// Function to determine status color
  Color getStatusColor(String status) =>
      status == 'Online' ? const Color(0xFF5CCE7C) : const Color(0xFFFF0000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(userName: 'Menu'), // Use custom AppBar
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchBarWidget(
              onChanged: _filterProfiles, // Connect search function
            ),
          ),
          Expanded(
            child:
                isLoading
                    ? const Center(
                      child: CircularProgressIndicator(),
                    ) // Show loading indicator
                    : ListView.builder(
                      itemCount: filteredProfiles.length,
                      itemBuilder: (context, index) {
                        final profile = filteredProfiles[index];
                        return ProfileCard(
                          name: profile['full_name'] ?? 'Unknown',
                          nationality:
                              profile['location']['country'] ?? 'Unknown',
                          status:
                              'Online', // Replace with actual status from backend
                          statusColor: getStatusColor(
                            'Online',
                          ), // Replace with actual status
                          imageUrl:
                              profile['profile_picture'] ??
                              '', // Replace with actual image URL
                          rating:
                              (profile['ratings']['average'] ?? 0).toDouble(),
                          bio: profile['intro'] ?? '',
                        );
                      },
                    ),
          ),
        ],
      ),
      bottomNavigationBar:
          const CustomBottomNavigationBar(), // Use custom Bottom Navigation
    );
  }
}
