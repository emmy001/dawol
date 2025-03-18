import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;

  const Fab({super.key, required this.onTap, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        onPressed: onTap,
        backgroundColor: Colors.black,
        child: Image.asset(imagePath, width: 24, height: 24),
      ),
    );
  }
}
