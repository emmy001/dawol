import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // Button text
  final VoidCallback? onPressed; // Callback for button press

  const CustomButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger the callback when tapped
      child: SizedBox(
        width: 327,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF232323), Colors.black],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text, // Use the passed text
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
