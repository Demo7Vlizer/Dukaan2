// Import required Flutter packages and custom widgets
import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/dukaan_logo.dart';

// Screen that displays Dukaan Premium features and pricing
class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom app bar with centered title
      appBar: const CustomAppBar(
        title: 'Dukaan Premium',
        centerTitle: true,
        bold: true,
      ),
      // Set background color to blue
      backgroundColor: const Color(0xFF136EB4),
      body: Stack(
        children: [
          // Create a split background - blue on top, white on bottom
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                color: const Color(0xFF136EB4),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // Scrollable content area
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                // Premium pricing card
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(20),
                  elevation: 2,
                  shadowColor: Colors.grey.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: Column(
                      children: [
                        // Dukaan logo and branding
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const DukaanLogo(size: 50),
                            const SizedBox(width: 8),
                            const Text(
                              'dukaan',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            // Add registered trademark symbol
                            Transform.translate(
                              offset: const Offset(2, -6),
                              child: const Text(
                                '®',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Premium pricing details
                        const Text(
                          'Get Dukaan Premium for just',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '₹4,999/year',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'All the advance features for scaling your\nbusiness.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Features section header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // List of premium features
                _buildFeaturesList(),
                const SizedBox(height: 16),
                // What is Dukaan Premium section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'What is Dukaan Premium?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Premium features image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/image/what_is_dukaan.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build list of premium features
  Widget _buildFeaturesList() {
    return Column(
      children: [
        _buildFeatureItem(
          icon: Icons.language,
          title: 'Custom domain name',
          subtitle:
              'Get your own custom domain and build your brand on the internet.',
        ),
        _buildFeatureItem(
          icon: Icons.verified_outlined,
          title: 'Verified seller badge',
          subtitle:
              'Get green verified badge under your store name and build trust.',
        ),
        _buildFeatureItem(
          icon: Icons.computer,
          title: 'Dukaan for PC',
          subtitle:
              'Access all the exclusive premium features on Dukaan for PC.',
        ),
        _buildFeatureItem(
          icon: Icons.headset_mic_outlined,
          title: 'Priority support',
          subtitle:
              'Get your questions resolved with our priority customer support.',
        ),
      ],
    );
  }

  // Build individual feature item with icon and description
  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Feature icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: Colors.blue, size: 40),
          ),
          const SizedBox(width: 12),
          // Feature title and description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
