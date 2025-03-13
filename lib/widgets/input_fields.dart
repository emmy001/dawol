import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final String hintText; // Hint text for the input field
  final bool
  obscureText; // Whether the text should be obscured (e.g., for passwords)
  final ValueChanged<String>? onChanged; // Callback for when the text changes

  const InputFields({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 64,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFCECECE)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          obscureText: obscureText, // Toggle text obscuring
          decoration: InputDecoration(
            border: InputBorder.none, // Remove the default underline
            hintText: hintText, // Use the passed hint text
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5), // Semi-transparent black
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          onChanged: onChanged, // Callback for text changes
        ),
      ),
    );
  }
}
