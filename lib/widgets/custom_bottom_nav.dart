// Import required Flutter and Get packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';

// Custom bottom navigation bar widget that shows different pages/tabs
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    // Get instance of navigation controller to handle page changes
    final controller = Get.find<NavigationController>();

    // Obx widget to make bottom nav reactive to state changes
    return Obx(() => BottomNavigationBar(
          // Current selected tab index from controller
          currentIndex: controller.currentIndex.value,
          // Function called when tab is tapped
          onTap: controller.changePage,
          // Fixed type means all items are always visible
          type: BottomNavigationBarType.fixed,
          // List of navigation items with their icons and labels
          items: const [
            // Home tab
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            // Order/Cart tab
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Order'),
            // Products catalog tab  
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view), label: 'Products'),
            // Management/Admin tab
            BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts), label: 'Manage'),
            // User account tab
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
        ));
  }
}
