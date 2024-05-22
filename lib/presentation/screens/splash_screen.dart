import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/login_screen.dart';
import 'package:qp_finance/presentation/utility/imageasset.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  Future<void> goToNextScreen() async {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAll(const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(),
          const Spacer(),
          Image.asset(
            ImageAssets.applogoPNG,
            width: 57,
            height: 52,
          ),
          const Gap(10),
          const SpinKitThreeBounce(
            color: Colors.blue,
            size: 10,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
