import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedStepProgress extends StatefulWidget {
  final int steps;
  final int totalSteps;
  final double moneyProgress; // Money progress as a percentage

  const AnimatedStepProgress({
    super.key,
    required this.steps,
    required this.totalSteps,
    required this.moneyProgress,
  });

  @override
  _AnimatedStepProgressState createState() => _AnimatedStepProgressState();
}

class _AnimatedStepProgressState extends State<AnimatedStepProgress>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double stepsProgress = widget.steps / widget.totalSteps;
    double moneyProgress = widget.moneyProgress; // Already a percentage (0-1)

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: stepsProgress),
      duration: const Duration(seconds: 2),
      builder: (context, value, _) {
        return Container(
           width: 200, // Increased size
          height: 200, // Increased size
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer deepPurple progress indicator (Steps)
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                  value: value,
                  // Animated steps progress value
                  strokeWidth: 24,
                  backgroundColor: Colors.deepPurple.withOpacity(0.3),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                ),
              ),
              // Inner orange progress indicator (Money)
              SizedBox(
                width: 180, // Increased size for inner indicator
                height: 180, // Increased size for inner indicator
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: moneyProgress),
                  duration: const Duration(seconds: 2),
                  builder: (context, moneyValue, _) {
                    return CircularProgressIndicator(
                      value: moneyValue,
                      strokeWidth: 7,
                      strokeCap: StrokeCap.round,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.orange),
                    );
                  },
                ),
              ),
              // Inner text displaying the steps
              Container(
                margin: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "${widget.steps}",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Text(
                      "of ${widget.totalSteps} steps",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // Icon representing the end of money progress
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: moneyProgress),
                duration: const Duration(seconds: 2),
                builder: (context, moneyValue, _) {
                  // Calculate the angle for the money progress
                  double angle =
                      2 * pi * moneyValue - pi / 2; // -pi/2 to start at the top

                  // Calculate the position of the icon along the circle
                  double iconRadius = 80; // Adjust radius to match larger size
                  double iconX = iconRadius * cos(angle);
                  double iconY = iconRadius * sin(angle);

                  return Positioned(
                    left: 90 + iconX - 10,
                    // Centered at (100,100) minus half icon size
                    top: 90 + iconY - 10,
                    // Centered at (100,100) minus half icon size
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.monetization_on,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
