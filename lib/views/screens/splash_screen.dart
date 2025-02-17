// Import required Flutter packages and routing
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For navigation
import 'package:shopping_app/routes/app_routes.dart'; // Contains route names
// import '../routes/app_routes.dart';

// Splash screen widget that shows when app first launches
// Uses StatefulWidget since we need to perform actions when screen loads
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// State class that handles the splash screen logic and UI
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // When screen first loads, wait 2 seconds then navigate to home screen
    // Using Future.delayed to create artificial loading time
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to home screen and remove all previous screens from stack
      Get.offAllNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Basic screen layout with centered Flutter logo
    return Scaffold(
      // Use app's primary theme color as background
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        // Display Flutter's logo as splash screen image
        child: FlutterLogo(
          size: 100, // Logo size of 100 logical pixels
          style: FlutterLogoStyle.markOnly, // Show only the logo mark, no text
          textColor: Colors.white, // Set logo color to white
        ),
      ),
    );
  }
} 