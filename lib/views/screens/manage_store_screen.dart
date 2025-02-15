import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_app_bar.dart';
import '../../controllers/navigation_controller.dart';
import '../../routes/app_routes.dart';

class ManageStoreScreen extends StatelessWidget {
  const ManageStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.04; // Responsive padding
    final crossAxisSpacing = screenSize.width * 0.03; // Responsive spacing
    final mainAxisSpacing = screenSize.width * 0.03;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(
        title: 'Manage Store',
        showBackButton: true,
        onBackPressed: () {
          Get.back();
          Get.find<NavigationController>()
              .updateIndexBasedOnRoute(AppRoutes.home);
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate card width based on screen width
          final cardWidth =
              (constraints.maxWidth - (padding * 2 + crossAxisSpacing)) / 2;
          final cardHeight = cardWidth * 0.7; // Aspect ratio of 1.67

          return GridView.custom(
            padding: EdgeInsets.all(padding),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: mainAxisSpacing,
              crossAxisSpacing: crossAxisSpacing,
              childAspectRatio: cardWidth / cardHeight,
            ),
            childrenDelegate: SliverChildListDelegate([
              _buildStoreCard(
                icon: Icons.campaign,
                iconColor: Colors.orange,
                backgroundColor: Colors.green.shade50,
                title: 'Marketing\nDesign',
                onTap: () {},
                constraints: BoxConstraints(maxWidth: cardWidth),
              ),
              _buildStoreCard(
                icon: Icons.payment,
                iconColor: Colors.green,
                backgroundColor: Colors.green.shade50,
                title: 'Online\nPayments',
                onTap: () => Get.toNamed(AppRoutes.payments),
                constraints: BoxConstraints(maxWidth: cardWidth),
              ),
              _buildStoreCard(
                icon: Icons.discount,
                iconColor: Colors.amber,
                backgroundColor: Colors.amber.shade50,
                title: 'Discount\nCoupons',
                onTap: () {},
                constraints: BoxConstraints(maxWidth: cardWidth),
              ),
              _buildStoreCard(
                icon: Icons.group,
                iconColor: Colors.blue,
                backgroundColor: Colors.blue.shade50,
                title: 'My\nCustomers',
                onTap: () {},
                constraints: BoxConstraints(maxWidth: cardWidth),
              ),
              _buildStoreCard(
                icon: Icons.qr_code_scanner,
                iconColor: Colors.grey,
                backgroundColor: Colors.grey.shade200,
                title: 'Store QR\nCode',
                onTap: () {},
                constraints: BoxConstraints(maxWidth: cardWidth),
              ),
              _buildStoreCard(
                icon: Icons.currency_rupee,
                iconColor: Colors.purple,
                backgroundColor: Colors.purple.shade50,
                title: 'Extra\nCharges',
                onTap: () {},
                constraints: BoxConstraints(maxWidth: cardWidth),
              ),
              _buildStoreCard(
                icon: Icons.description,
                iconColor: Colors.pink,
                backgroundColor: Colors.pink.shade50,
                title: 'Order Form',
                isNew: true,
                onTap: () {},
                constraints: BoxConstraints(maxWidth: cardWidth),
              ),
              _buildStoreCard(
                icon: Icons.workspace_premium,
                iconColor: Colors.amber,
                backgroundColor: Colors.amber.shade50,
                title: 'Dukaan\nPremium',
                onTap: () => Get.toNamed(AppRoutes.premium),
                isNew: true,
                constraints: BoxConstraints(maxWidth: cardWidth),
              ),
            ]),
          );
        },
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: navigationController.currentIndex.value,
            onTap: navigationController.changePage,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Orders'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view), label: 'Products'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.manage_accounts), label: 'Manage'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account'),
            ],
          )),
    );
  }

  Widget _buildStoreCard({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    bool isNew = false,
    required VoidCallback onTap,
    required BoxConstraints constraints,
  }) {
    return ConstrainedBox(
      constraints: constraints,
      child: Card(
        elevation: 2,
        color: Colors.white,
        shadowColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(icon, color: iconColor, size: 20),
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (isNew)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'NEW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
