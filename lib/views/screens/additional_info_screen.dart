import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_switch.dart';
import 'package:get/get.dart';
import '../../controllers/navigation_controller.dart';

class AdditionalInfoScreen extends StatelessWidget {
  const AdditionalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<NavigationController>().changePage(0);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Additional Information',
          centerTitle: true,
          showBackButton: true,
          onBackPressed: () {
            Get.back();
            Get.find<NavigationController>().changePage(0);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 16,
          ),
          child: Column(
            children: [
              _buildListItem(
                icon: Icons.share_outlined,
                title: 'Share Dhukkan App',
                showArrow: true,
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildListItem(
                icon: Icons.chat_bubble_outline,
                title: 'Change Language',
                showArrow: true,
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildListItem(
                icon: Icons.message,
                title: 'WhatsApp Chat Support',
                isSwitch: true,
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildListItem(
                icon: Icons.lock_outline,
                title: 'Privacy Policy',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildListItem(
                icon: Icons.star_outline,
                title: 'Rate Us',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              _buildListItem(
                icon: Icons.logout,
                title: 'Sign Out',
                onTap: () {},
              ),
              const SizedBox(height: 10),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  'Version 2.4.2',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    bool showArrow = false,
    bool isSwitch = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: isSwitch ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.grey.shade600),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            if (showArrow)
              const Icon(Icons.chevron_right, color: Colors.black54),
            if (isSwitch)
              CustomSwitch(
                value: true,
                enabled: false,
                onChanged: (value) {
                  // Handle switch change
                },
              ),
          ],
        ),
      ),
    );
  }
}
