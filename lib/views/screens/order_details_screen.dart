import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_receipt_icon.dart';
import '../../controllers/navigation_controller.dart';
import '../../routes/app_routes.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: 'Order #1688068',
        showBackButton: true,
        onBackPressed: () {
          Get.back();
          Get.find<NavigationController>()
              .updateIndexBasedOnRoute(AppRoutes.home);
        },
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
        children: [
          _buildOrderStatus(),
          _buildOrderItem(),
          _buildPriceDetails(),
          _buildCustomerDetails(),
          _buildAdditionalInfo(),
        ],
      ),
    );
  }

  Widget _buildOrderStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'May 31, 05:42 PM',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Delivered',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildOrderItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1 ITEM'),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const CustomReceiptIcon(
                    size: 35,
                    color: Color(0xFF0073E6),
                  ),
                  label: const Text(
                    'RECEIPT',
                    style: TextStyle(
                      color: Color(0xFF0073E6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ],
            ),
          ],
        ),
        // const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/image/tshirt.png',
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore | Men | Navy Blue',
                    style: TextStyle(fontSize: 16),
                  ),
                  // const Text('1'),
                  const Text('1 piece'),
                  const Text('Size: XL'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        // decoration: BoxDecoration(
                        //   color: Colors.blue.shade50,
                        //   borderRadius: BorderRadius.circular(4),
                        // ),
                        child: Row(
                          children: [
                            Container(
                              width: 25,
                              // height: 20,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 145, 197, 240),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 37, 136, 230),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              ' x ₹799',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text('₹799'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildPriceDetails() {
    return Column(
      children: [
        _buildPriceRow('Item Total', '₹799'),
        _buildPriceRow('Delivery', 'FREE', valueColor: Colors.green),
        const SizedBox(height: 8),
        _buildPriceRow('Grand Total', '₹799', isBold: true),
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value,
      {Color? valueColor, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'CUSTOMER DETAILS',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const Spacer(),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share, size: 20),
                  label: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: const Text(
                      'SHARE',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ],
        ),
        // const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Deepa',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            // const SizedBox(width: 10),
            // Spacer(),
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: const Icon(Icons.phone, color: Colors.blue, size: 25),
                ),
                // const SizedBox(width: 8),

                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                  icon: const Icon(Icons.chat, color: Colors.blue, size: 25),
                ),
              ],
            ),
          ],
        ),
        const Text('+91-7829000484'),
        // const Divider(height: 32),
        const SizedBox(height: 12),
        const Text(
          'Address',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const Text(
          'D 1101 Chartered Beverly\nHills,Subramanyapura P.O',
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('City'),
                  Text(
                    'Bangalore',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Pincode'),
                  Text(
                    '560061',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Payment'),
                  Text(
                    'Online',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.green.shade700,
                  width: 1.0,
                ),
              ),
              child: Text(
                'PAID',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'ADDITIONAL INFORMATION',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        SizedBox(height: 12),
        Text('State'),
        Text(
          'Karnataka',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12),
        Text('Email'),
        Text(
          'greeniceaqua@gmail.com',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
