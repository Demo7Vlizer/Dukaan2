import 'package:get/get.dart';
import '../routes/app_routes.dart';

// Controller class to handle navigation between different screens/pages
class NavigationController extends GetxController {
  // Observable variable to track which tab is currently selected (0-4)
  // Initialized with 0 which represents the Home tab
  final currentIndex = 0.obs;

  // Method to handle navigation when user taps on a bottom navigation tab
  void changePage(int index) {
    // Update the current tab index
    currentIndex.value = index;

    // Navigate to appropriate screen based on selected tab index
    switch (index) {
      case 0: // Home tab
        // Keep navigating back until we reach home screen
        Get.until((route) => route.settings.name == AppRoutes.home);
        break;
      case 1: // Orders tab
        // Only navigate if we're not already on the orders screen
        if (Get.currentRoute != AppRoutes.orderDetails) {
          Get.toNamed(AppRoutes.orderDetails);
        }
        break;
      case 2: // Catalogue tab
        // Only navigate if we're not already on the catalogue screen
        if (Get.currentRoute != AppRoutes.catalogue) {
          Get.toNamed(AppRoutes.catalogue);
        }
        break;
      case 3: // Manage Store tab
        // Only navigate if we're not already on the manage store screen
        if (Get.currentRoute != AppRoutes.manageStore) {
          Get.toNamed(AppRoutes.manageStore);
        }
        break;
      case 4: // Additional Info tab
        // Only navigate if we're not already on the additional info screen
        if (Get.currentRoute != AppRoutes.additionalInfo) {
          Get.toNamed(AppRoutes.additionalInfo);
        }
        break;
    }
  }

  // Method to update the selected tab index when navigation happens through other means
  // (like back button or direct navigation)
  void updateIndexBasedOnRoute(String route) {
    switch (route) {
      case AppRoutes.home:
        currentIndex.value = 0; // Set to Home tab
        break;
      case AppRoutes.orderDetails:
        currentIndex.value = 1; // Set to Orders tab
        break;
      case AppRoutes.catalogue:
        currentIndex.value = 2; // Set to Catalogue tab
        break;
      case AppRoutes.manageStore:
        currentIndex.value = 3; // Set to Manage Store tab
        break;
      case AppRoutes.additionalInfo:
        currentIndex.value = 4; // Set to Additional Info tab
        break;
    }
  }

  // Getter to easily access the current selected tab index
  int get selectedIndex => currentIndex.value;

  // Method to directly update the selected tab index
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
