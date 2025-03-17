import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath;

  const Fab({Key? key, required this.onPressed, required this.imagePath})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 60,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.black,
        child: Image.asset(imagePath, width: 10, height: 10),
      ),
    );
  }
}
