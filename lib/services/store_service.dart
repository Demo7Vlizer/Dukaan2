// Import the StoreModel class that defines the structure of store data
import '../models/store_model.dart';

// Service class that handles all store-related operations and API calls
class StoreService {
  // Method to fetch store details from the backend
  // Returns a Future that will contain a StoreModel object with store information
  Future<StoreModel> getStoreDetails() async {
    // TODO: In the future, this will fetch real data from an API
    // For now, returning hardcoded sample data for testing
    return StoreModel(
      name: "My Dukaan Store", // Store name
      transactionLimit: 50000, // Maximum transaction limit in rupees
      amountReceived: 13332, // Total amount received in rupees
      amountOnHold: 0, // Amount currently on hold/pending in rupees
    );
  }

  // Method to enable/disable WhatsApp support for the store
  // Takes a boolean parameter to toggle the support status
  Future<void> updateWhatsappSupport(bool enabled) async {
    // TODO: Implement API call to update WhatsApp support status in the backend
    // Will save whether store wants to enable WhatsApp support for customers
  }
} 