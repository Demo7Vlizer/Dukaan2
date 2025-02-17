// Import required packages and files
import 'package:get/get.dart';
import '../models/store_model.dart';
import '../services/store_service.dart';

// Controller class to manage store-related operations using GetX state management
class StoreController extends GetxController {
  // Instance of StoreService to handle API calls
  final StoreService _storeService = StoreService();

  // Observable store object that will automatically update UI when changed
  // Initialized with default values
  final store = StoreModel(
    name: "My Dukaan Store",
    transactionLimit: 50000,
    amountReceived: 13332,
    amountOnHold: 0,
  ).obs;

  // Observable boolean values to track WhatsApp support and loading states
  final isWhatsappSupport = true.obs;
  final isLoading = false.obs;

  // Called when controller is initialized
  @override
  void onInit() {
    super.onInit();
    fetchStoreDetails(); // Load store details when controller starts
  }

  // Fetch store details from the service/API
  Future<void> fetchStoreDetails() async {
    try {
      isLoading.value = true; // Show loading indicator
      final storeData = await _storeService.getStoreDetails();
      store.value = storeData; // Update store data
    } catch (e) {
      // Show error message if loading fails
      Get.snackbar('Error', 'Failed to load store details');
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }

  // Toggle WhatsApp support on/off and update in backend
  void toggleWhatsappSupport() {
    isWhatsappSupport.value = !isWhatsappSupport.value;
    _storeService.updateWhatsappSupport(isWhatsappSupport.value);
  }

  // Navigate to marketing screen
  void navigateToMarketing() {
    Get.toNamed('/marketing');
  }

  // Method to display store QR code
  void showQRCode() {
    // Implement QR code display logic
  }
} 