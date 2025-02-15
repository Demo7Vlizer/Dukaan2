import 'package:flutter/material.dart';

class CustomReceiptIcon extends StatelessWidget {
  final double size;
  final Color color;
  final VoidCallback? onTap;

  const CustomReceiptIcon({
    super.key,
    this.size = 35,
    this.color = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          size: Size(size, size),
          painter: ReceiptPainter(color: color),
        ),
      ),
    );
  }
}

class ReceiptPainter extends CustomPainter {
  final Color color;

  ReceiptPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Constants for zigzag pattern
    final zigzagWidth = size.width * 0.1;
    final zigzagHeight = size.height * 0.05;
    final leftX = size.width * 0.2;
    final rightX = size.width * 0.8;
    final topY = size.height * 0.2;
    final bottomY = size.height * 0.8;

    // Start from top-left
    path.moveTo(leftX, topY);

    // Draw top zigzag
    var x = leftX;
    while (x < rightX) {
      path.lineTo(x + zigzagWidth / 2, topY - zigzagHeight);
      path.lineTo(x + zigzagWidth, topY);
      x += zigzagWidth;
    }

    // Draw right side
    path.lineTo(rightX, bottomY);

    // Draw bottom zigzag (right to left)
    x = rightX;
    while (x > leftX) {
      path.lineTo(x - zigzagWidth / 2, bottomY + zigzagHeight);
      path.lineTo(x - zigzagWidth, bottomY);
      x -= zigzagWidth;
    }

    // Close the path
    path.close();

    canvas.drawPath(path, paint);

    // Draw three horizontal lines
    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5;

    for (var i = 0; i < 3; i++) {
      final y = size.height * (0.35 + i * 0.15);
      canvas.drawLine(
        Offset(size.width * 0.3, y),
        Offset(size.width * 0.7, y),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
