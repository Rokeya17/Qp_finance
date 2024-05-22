import 'package:flutter/material.dart';
import 'package:qp_finance/presentation/screens/splash_screen.dart';

class QPFinance extends StatelessWidget {
  const QPFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}