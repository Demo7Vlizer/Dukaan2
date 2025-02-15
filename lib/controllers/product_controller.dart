import 'package:get/get.dart';
import '../services/product_service.dart';
import '../models/product_model.dart';

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  bool isVisible;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isVisible = true,
  });
}

class ProductController extends GetxController {
  final products = <ProductModel>[].obs;
  final _productService = ProductService();

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts() async {
    products.value = await _productService.getProducts();
  }

  void toggleProductVisibility(String productId) {
    final index = products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      final product = products[index];
      products[index] = ProductModel(
        id: product.id,
        name: product.name,
        image: product.image,
        price: product.price,
        category: product.category,
        inStock: !product.inStock,
      );
      products.refresh();
    }
  }

  void shareProduct(String productId) {
    // Implement share functionality
  }
}
