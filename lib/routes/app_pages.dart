import 'package:get/get.dart';
import '../views/screens/home_screen.dart';
import '../views/screens/manage_store_screen.dart';
import '../views/screens/additional_info_screen.dart';
import '../views/screens/payments_screen.dart';
import '../views/screens/catalogue_screen.dart';
import '../views/screens/premium_screen.dart';
import '../views/screens/order_details_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.manageStore,
      page: () => const ManageStoreScreen(),
    ),
    GetPage(
      name: AppRoutes.additionalInfo,
      page: () => const AdditionalInfoScreen(),
    ),
    GetPage(
      name: AppRoutes.payments,
      page: () => const PaymentsScreen(),
    ),
    GetPage(
      name: AppRoutes.catalogue,
      page: () => const CatalogueScreen(),
    ),
    GetPage(
      name: AppRoutes.premium,
      page: () => const PremiumScreen(),
    ),
    GetPage(
      name: AppRoutes.orderDetails,
      page: () => const OrderDetailsScreen(),
    ),
  ];
} 