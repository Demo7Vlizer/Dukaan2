import '../models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProducts() async {
    // Mock data for now
    return [
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
        id: '4',
        name: 'Blue T-Shirt | Men',
        image: 'assets/image/product/blue_tshirt.png',
        price: 399,
        category: 'Men',
      ),
    ];
  }
}
