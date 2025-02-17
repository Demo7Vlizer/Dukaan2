// Import the material design package from Flutter
import 'package:flutter/material.dart';

// A custom widget that displays the Dukaan logo as a circular icon with a smile
class DukaanLogo extends StatelessWidget {
  // Size of the logo (default is 45)
  final double size;
  // Color of the logo (default is blue)
  final Color color;

  const DukaanLogo({
    super.key,
    this.size = 45,
    this.color = const Color(0xFF136EB4),
  });

  @override
  Widget build(BuildContext context) {
    // Outer circular container with the main color
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        // Inner white container that holds the smile
        child: Container(
          // Make inner container 60% of the outer size
          width: size * 0.6,
          height: size * 0.6,
          decoration: BoxDecoration(
            color: Colors.white,
            // Slightly rounded corners
            borderRadius: BorderRadius.circular(size * 0.1),
          ),
          // Custom paint widget to draw the smile
          child: CustomPaint(
            size: Size(size * 0.6, size * 0.6),
            painter: SmilePainter(color: color),
          ),
        ),
      ),
    );
  }
}

// Custom painter class that draws the smile shape
class SmilePainter extends CustomPainter {
  // Color of the smile (matches the outer circle)
  final Color color;

  SmilePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // Set up the paint object with style properties
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke // Draw outline only
      ..strokeWidth = size.width * 0.15 // Thickness of the smile line
      ..strokeCap = StrokeCap.round; // Rounded ends of the line

    // Create a curved path for the smile
    final path = Path()
      // Start point on the left
      ..moveTo(size.width * 0.2, size.height * 0.35)
      // Draw a curved line using quadratic bezier curve
      // Control point is at bottom center, end point is on the right
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.8,
        size.width * 0.8,
        size.height * 0.35,
      );

    // Draw the smile path
    canvas.drawPath(path, paint);
  }

  @override
  // Only repaint if the painter properties change
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
