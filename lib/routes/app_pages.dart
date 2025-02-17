// Import the GetX package for navigation and routing
import 'package:get/get.dart';

// Import all the screen files that we'll use in our app
import '../views/screens/home_screen.dart';
import '../views/screens/manage_store_screen.dart';
import '../views/screens/additional_info_screen.dart';
import '../views/screens/payments_screen.dart';
import '../views/screens/catalogue_screen.dart';
import '../views/screens/premium_screen.dart';
import '../views/screens/order_details_screen.dart';
import 'app_routes.dart';

// AppPages class defines all the pages/screens in our app and their routes
class AppPages {
  // List of all pages in the app with their corresponding routes
  static final pages = [
    // Home screen route
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    // Store management screen route
    GetPage(
      name: AppRoutes.manageStore,
      page: () => const ManageStoreScreen(),
    ),
    // Additional information screen route
    GetPage(
      name: AppRoutes.additionalInfo,
      page: () => const AdditionalInfoScreen(),
    ),
    // Payments and transactions screen route
    GetPage(
      name: AppRoutes.payments,
      page: () => const PaymentsScreen(),
    ),
    // Product catalogue screen route
    GetPage(
      name: AppRoutes.catalogue,
      page: () => const CatalogueScreen(),
    ),
    // Premium features screen route
    GetPage(
      name: AppRoutes.premium,
      page: () => const PremiumScreen(),
    ),
    // Order details screen route
    GetPage(
      name: AppRoutes.orderDetails,
      page: () => const OrderDetailsScreen(),
    ),
  ];
} 