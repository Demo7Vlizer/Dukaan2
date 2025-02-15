import 'package:flutter/material.dart';

class DukaanLogo extends StatelessWidget {
  final double size;
  final Color color;

  const DukaanLogo({
    super.key,
    this.size = 45,
    this.color = const Color(0xFF136EB4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: size * 0.6,
          height: size * 0.6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size * 0.1),
          ),
          child: CustomPaint(
            size: Size(size * 0.6, size * 0.6),
            painter: SmilePainter(color: color),
          ),
        ),
      ),
    );
  }
}

class SmilePainter extends CustomPainter {
  final Color color;

  SmilePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.15
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.35)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.8,
        size.width * 0.8,
        size.height * 0.35,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
