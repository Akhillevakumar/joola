import 'package:flutter/material.dart';

class ProgressCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String progressText;
  final String highlightedProgress;
  final double progressValue;
  final IconData iconData;
  final int rewardPoints;
  final Color progressColor;

  const ProgressCardWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.progressText,
    required this.highlightedProgress,
    required this.progressValue,
    required this.iconData,
    required this.rewardPoints,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Section
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    iconData,
                    size: 32.0,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16.0),
          // Text and Progress Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                // Subtitle
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 18.0),
                // Progress Text with RichText
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: highlightedProgress,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: progressColor,
                        ),
                      ),
                      TextSpan(
                        text: ' $progressText',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4.0),
                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.white,
                    color: progressColor,
                    minHeight: 8.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          // Reward Section
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(120)),
                color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.monetization_on,
                  size: 24.0,
                  color: Colors.orangeAccent,
                ),
                const SizedBox(width: 8.0),
                Text(
                  "$rewardPoints",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage

