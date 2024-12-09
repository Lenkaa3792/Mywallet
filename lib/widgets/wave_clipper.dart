import 'package:flutter/material.dart';
import '../constants/colors.dart';

class WaveClipper extends StatelessWidget {
  const WaveClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Reduced height
      child: ClipPath(
        clipper: TopWaveClipper(),
        child: Container(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); // Start at the top-left corner
    path.quadraticBezierTo(
      size.width / 4,
      20, // Move the curve upwards
      size.width / 2,
      10, // Curve closer to the top
    );
    path.quadraticBezierTo(
      3 / 4 * size.width,
      0, // End the curve at the top-right corner
      size.width,
      15, // Slight curve at the end
    );
    path.lineTo(size.width, size.height); // Continue the path to the bottom-right corner
    path.lineTo(0, size.height); // And then to the bottom-left corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
