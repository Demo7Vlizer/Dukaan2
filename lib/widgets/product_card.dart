// Import necessary Flutter material design package and product model
import 'package:flutter/material.dart';
import '../models/product_model.dart';

// Widget that displays a product card with image, details and actions
class ProductCard extends StatelessWidget {
  // Product data to display
  final ProductModel product;
  // Callback function when visibility toggle is pressed
  final VoidCallback onToggleVisibility;
  // Callback function when share button is pressed
  final VoidCallback onShare;

  // Constructor to initialize the product card
  const ProductCard({
    super.key,
    required this.product,
    required this.onToggleVisibility,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    // Card widget with no elevation (shadow)
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image and details section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              // Product details section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name and more options button
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {
                            // Show options menu when pressed
                          },
                        ),
                      ],
                    ),
                    // Product quantity
                    Text('1 piece'),
                    // Product price in Indian Rupees
                    Text(
                      '₹${product.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Stock status and visibility toggle
                    Row(
                      children: [
                        Text(
                          product.inStock ? 'In Stock' : 'Out of Stock',
                          style: TextStyle(
                            color: product.inStock ? Colors.green : Colors.red,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          value: product.inStock,
                          onChanged: (_) => onToggleVisibility(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Horizontal line separator
          const Divider(),
          // Share product button
          TextButton.icon(
            onPressed: onShare,
            icon: const Icon(Icons.share),
            label: const Text('Share Product'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}