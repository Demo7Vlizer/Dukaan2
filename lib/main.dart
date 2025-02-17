// Import required Flutter and GetX packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import route configurations
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
// Import controllers for navigation and store management
import 'controllers/navigation_controller.dart';
import 'controllers/store_controller.dart';

// Entry point of the application
void main() {
  // Initialize controllers using GetX dependency injection
  Get.put(NavigationController()); // Controller for handling navigation
  Get.put(StoreController());      // Controller for managing store data
  // Start the Flutter application by running MyApp
  runApp(const MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Return a GetX-enabled MaterialApp with app configuration
    return GetMaterialApp(
      title: 'Dukaan App', // App title shown in task switcher
      theme: ThemeData(
        // Set primary color to blue
        primaryColor: const Color(0xFF2196F3),
        // Configure color scheme based on primary blue color
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
          primary: const Color(0xFF2196F3),
        ),
        useMaterial3: true, // Enable Material Design 3
      ),
      initialRoute: AppRoutes.home, // Set initial screen to home
      getPages: AppPages.pages,     // Configure app routes
      debugShowCheckedModeBanner: false, // Hide debug banner
    );
  }
}
