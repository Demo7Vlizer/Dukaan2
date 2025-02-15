import 'package:get/get.dart';
import '../routes/app_routes.dart';

class NavigationController extends GetxController {
  final currentIndex = 0.obs; // Initialize with 0 for Home tab

  void changePage(int index) {
    currentIndex.value = index;

    switch (index) {
      case 0:
        Get.until((route) => route.settings.name == AppRoutes.home);
        break;
      case 1:
        if (Get.currentRoute != AppRoutes.orderDetails) {
          Get.toNamed(AppRoutes.orderDetails);
        }
        break;
      case 2:
        if (Get.currentRoute != AppRoutes.catalogue) {
          Get.toNamed(AppRoutes.catalogue);
        }
        break;
      case 3:
        if (Get.currentRoute != AppRoutes.manageStore) {
          Get.toNamed(AppRoutes.manageStore);
        }
        break;
      case 4:
        if (Get.currentRoute != AppRoutes.additionalInfo) {
          Get.toNamed(AppRoutes.additionalInfo);
        }
        break;
    }
  }

  // Add this method to update index based on route
  void updateIndexBasedOnRoute(String route) {
    switch (route) {
      case AppRoutes.home:
        currentIndex.value = 0;
        break;
      case AppRoutes.orderDetails:
        currentIndex.value = 1;
        break;
      case AppRoutes.catalogue:
        currentIndex.value = 2;
        break;
      case AppRoutes.manageStore:
        currentIndex.value = 3;
        break;
      case AppRoutes.additionalInfo:
        currentIndex.value = 4;
        break;
    }
  }

  int get selectedIndex => currentIndex.value;

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
