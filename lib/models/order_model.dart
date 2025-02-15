class OrderModel {
  final String id;
  final DateTime orderDate;
  final String status;
  final List<OrderItem> items;
  final double total;
  final String customerName;
  final String customerPhone;
  final String customerEmail;
  final Address address;
  final String paymentMethod;
  final bool isPaid;

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
    this.isPaid = false,
  });
}

class OrderItem {
  final String productId;
  final String name;
  final String image;
  final double price;
  final int quantity;
  final String size;

  OrderItem({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.size,
  });
}

class Address {
  final String street;
  final String city;
  final String state;
  final String pincode;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.pincode,
  });
} 