// Import necessary Flutter packages and custom widgets
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_dropdown.dart';
// import '../../controllers/store_controller.dart';

// PaymentsScreen widget to display payment information and transactions
class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Main scaffold that structures the entire screen
    return Scaffold(
      // Custom app bar with title and info button
      appBar: CustomAppBar(
        title: 'Payments',
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      // Scrollable content area containing payment information
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTransactionLimitCard(), // Card showing transaction limits
            _buildPaymentOptions(), // Payment method options
            _buildPaymentsOverview(), // Overview of payment statistics
            _buildTransactionTabs(), // Tabs to filter transactions
            _buildTransactionList(), // List of transactions
          ],
        ),
      ),
    );
  }

  // Widget to display transaction limit information in a card
  Widget _buildTransactionLimitCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transaction Limit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A free limit up to which you will receive the online payments directly in your bank.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            // Progress bar showing used transaction limit
            LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 8),
            const Text(
              '36,668 left out of ₹50,000',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Button to increase transaction limit
            Container(
              height: 32,
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0073E6),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                ),
                child: const Text(
                  'Increase limit',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to display payment method options
  Widget _buildPaymentOptions() {
    return Column(
      children: [
        // Default payment method option
        ListTile(
          title: const Text('Default Method'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Online Payments',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Icon(Icons.chevron_right, color: Colors.grey.shade600),
            ],
          ),
        ),
        const Divider(),
        // Payment profile option
        ListTile(
          title: const Text('Payment Profile'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bank Account',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Icon(Icons.chevron_right, color: Colors.grey.shade600),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  // Widget to show overview of payments with statistics
  Widget _buildPaymentsOverview() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Payments Overview',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Dropdown to select time period
              CustomDropdown(
                text: 'Life Time',
                spacing: 16,
                onTap: () {
                  // Handle dropdown tap
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Cards showing amount on hold and received
          Row(
            children: [
              Expanded(
                child: _buildOverviewCard(
                  'AMOUNT ON HOLD',
                  '₹0',
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildOverviewCard(
                  'AMOUNT RECEIVED',
                  '₹13,332',
                  Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget to build individual overview cards
  Widget _buildOverviewCard(String title, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to display transaction filter tabs
  Widget _buildTransactionTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildTab('On hold', false),
          const SizedBox(width: 8),
          _buildTab('Payouts (15)', true),
          const SizedBox(width: 8),
          _buildTab('Refunds', false),
        ],
      ),
    );
  }

  // Widget to build individual filter tabs
  Widget _buildTab(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Widget to display list of transactions
  Widget _buildTransactionList() {
    return Column(
      children: [
        _buildTransactionItem(
          'Order #1688068',
          'Jul 12, 02:06 PM',
          '₹799',
          '₹799 deposited to: 58860200000138',
          imageUrl: 'assets/image/tshirt.png',
        ),
        _buildTransactionItem(
          'Order #1457741',
          'Apr 26, 07:47 AM',
          '₹397.4',
          '₹397.4 deposited to: 58860200000138',
          imageUrl: 'assets/image/tshirt.png',
        ),
      ],
    );
  }

  // Widget to build individual transaction items
  Widget _buildTransactionItem(
      String orderId, String date, String amount, String description,
      {String? imageUrl}) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          // Product image if available
          leading: imageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    imageUrl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderId,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                amount,
                style: const TextStyle(
                  color: Color(0xFF0073E6),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          // Transaction details in subtitle
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              // Transaction status indicator
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Successful',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
