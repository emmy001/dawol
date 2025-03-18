import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String nationality;
  final String status;
  final Color statusColor;
  final String imageUrl;
  final double rating;
  final String bio;

  const ProfileCard({
    super.key,
    required this.name,
    required this.nationality,
    required this.status,
    required this.statusColor,
    required this.imageUrl,
    required this.rating,
    required this.bio,
  });

  // Function to get country flag URL based on nationality
  String? getCountryFlag(String nationality) {
    Map<String, String> countryCodes = {
      "Canada": "ca",
      "Brazil": "br",
      "Nigeria": "ng",
      "Kenya": "ke",
      "United States": "us",
      "United Kingdom": "gb",
      "Germany": "de",
      "France": "fr",
      "India": "in",
    };

    return countryCodes.containsKey(nationality)
        ? "https://flagcdn.com/w40/${countryCodes[nationality]}.png"
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.56),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),

          // Profile Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),

                // Nationality with Flag
                Row(
                  children: [
                    if (getCountryFlag(nationality) != null)
                      Image.network(
                        getCountryFlag(nationality)!,
                        width: 20,
                        height: 15,
                        fit: BoxFit.contain,
                      ),
                    const SizedBox(width: 6),
                    Container(
                      constraints: const BoxConstraints(
                        minWidth: 80,
                      ), // Fixed width for alignment
                      child: Text(
                        nationality,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Status Indicator
                    Container(
                      width: 5,
                      height: 5,
                      decoration: ShapeDecoration(
                        color: statusColor,
                        shape: const OvalBorder(),
                      ),
                    ),
                    const SizedBox(width: 6),
                    SizedBox(
                      width: 50, // Fixed width for alignment
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Bio
                Text(
                  bio,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w100,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),

                // Rating
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 13),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
