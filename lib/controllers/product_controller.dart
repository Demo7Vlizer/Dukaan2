// Import required packages and files
import 'package:get/get.dart';
import '../services/product_service.dart';
import '../models/product_model.dart';

// Product class to define the structure of a product
class Product {
  final String id;          // Unique identifier for the product
  final String name;        // Name of the product
  final String imageUrl;    // URL of the product image
  final double price;       // Price of the product
  bool isVisible;           // Whether product is visible in store

  // Constructor to create a new Product instance
  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isVisible = true,  // Default visibility is true
  });
}

// Controller class to manage product-related operations using GetX
class ProductController extends GetxController {
  // Observable list to store products and update UI automatically when changed
  final products = <ProductModel>[].obs;
  
  // Instance of ProductService to handle API calls
  final _productService = ProductService();

  // Called when controller is initialized
  @override
  void onInit() {
    super.onInit();
    loadProducts();  // Load products when controller starts
  }

  // Fetch products from the service/API
  Future<void> loadProducts() async {
    products.value = await _productService.getProducts();
  }

  // Toggle product visibility/stock status
  void toggleProductVisibility(String productId) {
    // Find product index in list by ID
    final index = products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      // If product found, get current product
      final product = products[index];
      // Create new product with toggled stock status
      products[index] = ProductModel(
        id: product.id,
        name: product.name,
        image: product.image,
        price: product.price,
        category: product.category,
        inStock: !product.inStock,  // Toggle in-stock status
      );
      products.refresh();  // Notify UI to update
    }
  }

  // Method to share product (to be implemented)
  void shareProduct(String productId) {
    // Implement share functionality
  }
}
