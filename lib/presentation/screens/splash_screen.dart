import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/home_screen.dart';
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
      Get.offAll(const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          Spacer(),
          SvgPicture.asset(
            ImageAssets.applogoSVG,
            width: 100,
          ),
          SpinKitThreeBounce(
            color: Colors.grey,
            size: 10,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
