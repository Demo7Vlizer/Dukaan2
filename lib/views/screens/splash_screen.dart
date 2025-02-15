import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/routes/app_routes.dart';
// import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to home screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: FlutterLogo(
          size: 100,
          style: FlutterLogoStyle.markOnly,
          textColor: Colors.white,
        ),
      ),
    );
  }
} 