import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String unit;
  final Color iconColor;

  const InfoWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.unit,
    this.iconColor = Colors.red, // Default color for the icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 32,
            ),
            const SizedBox(width: 8), // Add spacing between icon and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Align text to the start
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
                Text(
                  unit,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
