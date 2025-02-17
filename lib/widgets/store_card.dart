// Import the material design package from Flutter
import 'package:flutter/material.dart';

// A custom widget that displays a card with an icon, title and optional 'NEW' badge
class StoreCard extends StatelessWidget {
  // Icon to display in the card
  final IconData icon;
  // Color used for the icon and its background
  final Color color;
  // Title text to display below the icon
  final String title;
  // Whether to show a 'NEW' badge on the card
  final bool isNew;
  // Function to call when card is tapped
  final VoidCallback? onTap;

  // Constructor to initialize the store card
  const StoreCard({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    this.isNew = false, // Default value is false
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Card widget with a slight elevation for shadow effect
    return Card(
      elevation: 2,
      child: InkWell(
        // Add tap functionality with ripple effect
        onTap: onTap,
        child: Stack(
          children: [
            // Main content of the card
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container for the icon with background
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // Use a lighter version of the main color for background
                      // ignore: deprecated_member_use
                      color: color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: color),
                  ),
                  // Add spacing between icon and title
                  const SizedBox(height: 8),
                  // Title text
                  Text(
                    title,  
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Conditionally show 'NEW' badge if isNew is true
            if (isNew)
              Positioned(
                // Position badge at top-right corner
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
} 