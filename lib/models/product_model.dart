// Class that represents a product in the store/catalog
class ProductModel {
  final String id;          // Unique identifier for the product
  final String name;        // Name/title of the product
  final String image;       // URL or path to product's image
  final double price;       // Price of the product
  final bool inStock;       // Whether product is available in stock
  final String category;    // Category the product belongs to (e.g. clothing, electronics)
  final int quantity;       // Number of units/items
  final String description; // Detailed description of the product

  // Constructor to create a new product
  // Required parameters must be provided, optional ones have default values
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.inStock = true,    // By default product is in stock
    required this.category,
    this.quantity = 1,      // Default quantity is 1
    this.description = '',  // Default description is empty
  });
} 