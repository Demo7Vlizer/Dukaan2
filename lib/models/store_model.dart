// Class that represents a store in the application
class StoreModel {
  final String name;              // Name of the store
  final String? domain;           // Optional custom domain for the store's website
  final bool isPremium;           // Whether store has premium features enabled
  final double transactionLimit;  // Maximum transaction amount allowed
  final double amountReceived;    // Total amount received from sales
  final double amountOnHold;      // Amount temporarily held/pending

  // Constructor to create a new store
  // Required parameters must be provided, optional ones have default values
  StoreModel({
    required this.name,           // Store name is required
    this.domain,                  // Domain is optional
    this.isPremium = false,       // By default store is not premium
    this.transactionLimit = 50000, // Default transaction limit is 50000
    this.amountReceived = 0,      // Initially no amount received
    this.amountOnHold = 0,        // Initially no amount on hold
  });
} 