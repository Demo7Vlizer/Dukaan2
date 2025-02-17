// Main class to represent an order in the system
class OrderModel {
  final String id;                  // Unique identifier for the order
  final DateTime orderDate;         // Date and time when order was placed
  final String status;             // Current status of the order (e.g. pending, delivered)
  final List<OrderItem> items;      // List of items in the order
  final double total;              // Total amount of the order
  final String customerName;        // Name of the customer who placed the order
  final String customerPhone;       // Customer's phone number
  final String customerEmail;       // Customer's email address
  final Address address;           // Delivery address details
  final String paymentMethod;      // Method used for payment (e.g. cash, card)
  final bool isPaid;               // Whether payment has been received

  // Constructor to create a new order
  OrderModel({
    required this.id,
    required this.orderDate,
    required this.status,
    required this.items,
    required this.total,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
    required this.address,
    required this.paymentMethod,
    this.isPaid = false,           // By default, order is marked as unpaid
  });
}

// Class to represent individual items within an order
class OrderItem {
  final String productId;          // Unique identifier of the product
  final String name;               // Name of the product
  final String image;              // URL or path to product image
  final double price;              // Price of single unit
  final int quantity;              // Number of units ordered
  final String size;               // Size variant of the product

  // Constructor to create a new order item
  OrderItem({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.size,
  });
}

// Class to store delivery address details
class Address {
  final String street;             // Street address including house/building number
  final String city;               // City name
  final String state;              // State or province
  final String pincode;            // Postal/ZIP code

  // Constructor to create a new address
  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.pincode,
  });
} 