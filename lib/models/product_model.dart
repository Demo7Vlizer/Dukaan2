class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final bool inStock;
  final String category;
  final int quantity;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.inStock = true,
    required this.category,
    this.quantity = 1,
    this.description = '',
  });
} 