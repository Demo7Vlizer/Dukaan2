class StoreModel {
  final String name;
  final String? domain;
  final bool isPremium;
  final double transactionLimit;
  final double amountReceived;
  final double amountOnHold;

  StoreModel({
    required this.name,
    this.domain,
    this.isPremium = false,
    this.transactionLimit = 50000,
    this.amountReceived = 0,
    this.amountOnHold = 0,
  });
} 