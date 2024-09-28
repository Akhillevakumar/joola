import 'package:flutter/material.dart';

class OvalOutlinedButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const OvalOutlinedButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 24), // Icon size
        label: Text(
          text,
          style: const TextStyle(color: Colors.deepPurpleAccent),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          // Button padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Oval shape
          ),
          side: const BorderSide(width: 1.0, color: Colors.grey),
          // Outline color and thickness
          textStyle: const TextStyle(fontSize: 16), // Text size
        ),
      ),
    );
  }
}
