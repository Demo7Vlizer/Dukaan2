import '../models/store_model.dart';

class StoreService {
  Future<StoreModel> getStoreDetails() async {
    // Implement API call here
    // For now, returning mock data
    return StoreModel(
      name: "My Dukaan Store",
      transactionLimit: 50000,
      amountReceived: 13332,
      amountOnHold: 0,
    );
  }

  Future<void> updateWhatsappSupport(bool enabled) async {
    // Implement API call to update WhatsApp support status
  }
} 