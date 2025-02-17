// Import necessary Flutter and custom packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_switch.dart';
import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';
import '../../controllers/navigation_controller.dart';

// Screen that displays the product catalogue with tabs for Products and Categories
class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the product controller to manage product data
    final controller = Get.put(ProductController());

    // Handle back button press to return to main screen
    return WillPopScope(
      onWillPop: () async {
        Get.find<NavigationController>().changePage(0);
        return true;
      },
      // Create tabbed interface with Products and Categories tabs
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: CustomAppBar(
            title: 'Catalogue',
            showBackButton: true,
            onBackPressed: () {
              Get.back();
              Get.find<NavigationController>().changePage(0);
            },
            // Configure the tab bar appearance
            bottom: TabBar(
              tabs: const [
                Tab(text: 'Products'),
                Tab(text: 'Categories'),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.8),
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            // Add search button to app bar
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Implement search functionality here
                },
              ),
            ],
          ),
          // Content area showing either Products list or Categories
          body: TabBarView(
            children: [
              // Products Tab - Shows scrollable list of product cards
              Obx(() => ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.products.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) =>
                        _buildProductCard(controller.products[index]),
                  )),
              // Categories Tab - Placeholder for future implementation
              const Center(child: Text('Categories Coming Soon')),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build individual product cards
  Widget _buildProductCard(ProductModel product) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Container
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Product Details Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name and Menu Icon
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(Icons.more_vert, color: Colors.grey.shade600),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Product Quantity
                      Text(
                        '1 piece',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Product Price
                      Text(
                        '₹${product.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Stock Status and Visibility Toggle
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'In Stock',
                              style: TextStyle(
                                color: Colors.green.shade700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          CustomSwitch(
                            value: product.inStock,
                            enabled: false,
                            onChanged: (value) {
                              Get.find<ProductController>()
                                  .toggleProductVisibility(product.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Share Product Button at bottom of card
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share_outlined,
                      size: 20, color: Colors.grey.shade700),
                  const SizedBox(width: 8),
                  Text(
                    'Share Product',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
