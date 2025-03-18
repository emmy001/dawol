import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
          _buildNavItem(context, "assets/icons/home.svg", "Home", '/home'),
          _buildNavItem(context, "assets/icons/search.svg", "Search", '/menu'),
          _buildNavItem(
            context,
            "assets/icons/analytics.svg",
            "Analytics",
            '/analytics',
          ),
          _buildNavItem(
            context,
            "assets/icons/history.svg",
            "History",
            '/history',
          ),
          _buildNavItem(
            context,
            "assets/icons/profile.svg",
            "Profile",
            '/profile',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String iconPath,
    String label,
    String route,
  ) {
    bool isActive = GoRouterState.of(context).uri.toString() == route;

    return GestureDetector(
      onTap: () {
        if (GoRouterState.of(context).uri.toString() != route) {
          context.go(route); // Navigate to the selected route
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              isActive ? const Color(0xFF9747FF) : Colors.black,
              BlendMode.srcIn,
            ),
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
      ),
    );
  }
}
