// Import the ProductModel class which defines the structure for product data
import '../models/product_model.dart';

// Service class that handles all product-related operations
class ProductService {
  // Method to fetch list of products
  // Returns a Future (promise) that will eventually contain a List of ProductModel objects
  Future<List<ProductModel>> getProducts() async {
    // TODO: In the future, this will fetch real data from an API
    // For now, we're using hardcoded sample data for testing
    return [
      // Each ProductModel represents one product with its details:
      // id: unique identifier
      // name: product name/title
      // image: path to product image file
      // price: cost in rupees
      // category: product category/type
      ProductModel(
        id: '1',
        name: 'Couch Potato | Women...',
        image: 'assets/image/product/white_t-shirt.png',
        price: 799,
        category: 'Women',
      ),
      ProductModel(
        id: '2',
        name: 'Couch Potato | Men | Bl...',
        image: 'assets/image/tshirt.png',
        price: 799,
        category: 'Men',
      ),
      ProductModel(
        id: '3',
        name: 'Mug | Explore',
        image: 'assets/image/product/Mug_Explore.jpg',
        price: 399,
        category: 'Accessories',
      ),
      ProductModel(
        id: '4',
        name: 'Mug Drawing | Explore',
        image: 'assets/image/product/mug_drawing.png',
        price: 399,
        category: 'Accessories',
      ),
      ProductModel(
        id: '4', // Note: Duplicate ID should be fixed in production
        name: 'Blue T-Shirt | Men',
        image: 'assets/image/product/blue_tshirt.png',
        price: 399,
        category: 'Men',
      ),
    ];
  }
}
