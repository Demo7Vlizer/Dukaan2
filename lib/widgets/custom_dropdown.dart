import 'package:flutter/material.dart';

/// A custom dropdown widget that displays text with a dropdown arrow
/// This widget can be tapped to trigger an action (like showing a menu)
class CustomDropdown extends StatelessWidget {
  // The text to display in the dropdown
  final String text;
  // Function to call when dropdown is tapped
  final VoidCallback? onTap;
  // Space between the text and dropdown arrow
  final double spacing;

  const CustomDropdown({
    super.key,
    required this.text,
    this.onTap,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    // InkWell provides tap feedback effect
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        // Add padding around the content
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          // Row will only take up as much space as its children need
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the dropdown text
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Add spacing between text and arrow
            SizedBox(width: spacing),
            // Custom painted dropdown arrow
            CustomPaint(
              size: const Size(8, 4), // Size of the arrow
              painter: DropdownArrowPainter(
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom painter class that draws a downward-pointing triangle
/// Used as the dropdown arrow indicator
class DropdownArrowPainter extends CustomPainter {
  // Color of the dropdown arrow
  final Color color;

  DropdownArrowPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // Set up the paint object with color and fill style
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Create a triangular path for the arrow
    final path = Path()
      ..moveTo(0, 0)                    // Start at top-left
      ..lineTo(size.width, 0)           // Draw line to top-right
      ..lineTo(size.width / 2, size.height) // Draw line to bottom-middle
      ..close();                        // Close the path to form a triangle

    // Draw the triangular path
    canvas.drawPath(path, paint);
  }

  @override
  // Only repaint if necessary (in this case, never)
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
