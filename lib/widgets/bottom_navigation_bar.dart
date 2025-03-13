import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Take full width
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFFEFEFE),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem("assets/icons/home.svg", "Home", isActive: true),
          _buildNavItem("assets/icons/search.svg", "Search"),
          _buildNavItem("assets/icons/analytics.svg", "Analytics"),
          _buildNavItem("assets/icons/history.svg", "History"),
          _buildNavItem("assets/icons/profile.svg", "Profile"),
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconPath, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          width: 24, // Adjust size as needed
          height: 24,
          colorFilter: ColorFilter.mode(
            isActive ? const Color(0xFF9747FF) : Colors.black,
            BlendMode.srcIn,
          ), // Change color based on active state
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF9747FF) : Colors.black,
            fontSize: 10.0,
            fontFamily: 'Jaldi',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
