import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/splash_screen.dart';

class QPFinance extends StatelessWidget {
  const QPFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(fontFamily: 'SfProDisplay'),
    );
  }
}
