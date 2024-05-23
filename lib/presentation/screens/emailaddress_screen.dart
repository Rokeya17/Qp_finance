import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';

class EmailaddressScreen extends StatelessWidget {
  const EmailaddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
          title: 'Email address',
          onPressed: () {
            Get.back();
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Enter your Email address',
            style: TextStyle(
              letterSpacing: -0.5,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'Enter the email address where you can be reached.\n No one else will see this on your profile',
            style: TextStyle(
              letterSpacing: -0.5,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontFamily: 'SF Pro Display',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
