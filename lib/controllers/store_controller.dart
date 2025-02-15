import 'package:get/get.dart';
import '../models/store_model.dart';
import '../services/store_service.dart';

class StoreController extends GetxController {
  final StoreService _storeService = StoreService();
  final store = StoreModel(
    name: "My Dukaan Store",
    transactionLimit: 50000,
    amountReceived: 13332,
    amountOnHold: 0,
  ).obs;

  final isWhatsappSupport = true.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStoreDetails();
  }

  Future<void> fetchStoreDetails() async {
    try {
      isLoading.value = true;
      final storeData = await _storeService.getStoreDetails();
      store.value = storeData;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load store details');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleWhatsappSupport() {
    isWhatsappSupport.value = !isWhatsappSupport.value;
    _storeService.updateWhatsappSupport(isWhatsappSupport.value);
  }

  void navigateToMarketing() {
    Get.toNamed('/marketing');
  }

  void showQRCode() {
    // Implement QR code display logic
  }
} 