import 'package:flutter/material.dart';

// A custom widget that displays a receipt icon which can be tapped
class CustomReceiptIcon extends StatelessWidget {
  // Size of the receipt icon (default is 35)
  final double size;
  // Color of the receipt icon (default is white) 
  final Color color;
  // Function to call when icon is tapped (optional)
  final VoidCallback? onTap;

  const CustomReceiptIcon({
    super.key,
    this.size = 35,
    this.color = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // InkWell provides tap feedback effect
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        // CustomPaint widget allows drawing custom shapes
        child: CustomPaint(
          size: Size(size, size),
          painter: ReceiptPainter(color: color),
        ),
      ),
    );
  }
}

// Custom painter class that draws the receipt icon shape
class ReceiptPainter extends CustomPainter {
  final Color color;

  ReceiptPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // Set up paint object with color and fill style
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Create a path to draw the receipt shape
    final path = Path();

    // Define measurements for the zigzag pattern
    final zigzagWidth = size.width * 0.1;   // Width of each zigzag
    final zigzagHeight = size.height * 0.05; // Height of zigzag peaks
    final leftX = size.width * 0.2;          // Left edge of receipt
    final rightX = size.width * 0.8;         // Right edge of receipt
    final topY = size.height * 0.2;          // Top edge of receipt
    final bottomY = size.height * 0.8;       // Bottom edge of receipt

    // Start drawing from top-left corner
    path.moveTo(leftX, topY);

    // Draw zigzag pattern along top edge (left to right)
    var x = leftX;
    while (x < rightX) {
      path.lineTo(x + zigzagWidth / 2, topY - zigzagHeight);  // Up
      path.lineTo(x + zigzagWidth, topY);                     // Down
      x += zigzagWidth;
    }

    // Draw straight line down right side
    path.lineTo(rightX, bottomY);

    // Draw zigzag pattern along bottom edge (right to left)
    x = rightX;
    while (x > leftX) {
      path.lineTo(x - zigzagWidth / 2, bottomY + zigzagHeight);  // Down
      path.lineTo(x - zigzagWidth, bottomY);                     // Up
      x -= zigzagWidth;
    }

    // Close the path by connecting back to start
    path.close();

    // Draw the receipt outline
    canvas.drawPath(path, paint);

    // Set up paint for the horizontal lines inside receipt
    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5;

    // Draw three horizontal lines to represent text on receipt
    for (var i = 0; i < 3; i++) {
      final y = size.height * (0.35 + i * 0.15);  // Space lines evenly
      canvas.drawLine(
        Offset(size.width * 0.3, y),  // Start point of line
        Offset(size.width * 0.7, y),  // End point of line
        linePaint,
      );
    }
  }

  // Only repaint if the color changes
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
