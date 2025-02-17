// Import necessary Flutter packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Custom AppBar widget that can be reused across the app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Properties to customize the AppBar
  final dynamic title;              // Title of the AppBar (can be String or Widget)
  final List<Widget>? actions;      // List of action buttons to show on the right
  final PreferredSizeWidget? bottom; // Optional bottom widget (like TabBar)
  final bool showBackButton;        // Whether to show the back button
  final VoidCallback? onBackPressed; // Custom back button handler
  final bool centerTitle;           // Whether to center the title
  final bool bold;                  // Whether to make the title text bold

  // Constructor to initialize the CustomAppBar
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
    this.showBackButton = true,    // Back button shown by default
    this.onBackPressed,
    this.centerTitle = false,      // Title aligned to left by default
    this.bold = false,             // Normal font weight by default
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Show back button if enabled, otherwise show nothing
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              // Use custom back handler if provided, otherwise use Get.back()
              onPressed: onBackPressed ?? () => Get.back(),
            )
          : null,
      // If title is a String, wrap in Text widget with optional bold style
      title: title is String 
          ? Text(
              title,
              style: TextStyle(
                fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
              ),
            )
          : title,
      centerTitle: centerTitle,
      backgroundColor: const Color(0xFF136EB4),  // Blue background color
      foregroundColor: Colors.white,             // White text and icons
      actions: actions,
      bottom: bottom,
    );
  }

  // Calculate preferred size of AppBar including bottom widget if present
  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
