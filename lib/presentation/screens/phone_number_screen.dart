import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/password_screen.dart';

import '../utility/button_widget.dart';
import 'widgets/appbarwidget.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({super.key});
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
          title: 'Mobile Number',
          onPressed: () {
            Get.back();
          }),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter your Mobile Number',
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
                'Enter the Mobile Number where you can be reached.\n No one else will see this on your profile',
                style: TextStyle(
                  letterSpacing: -0.5,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(50),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: ' Phone Number',
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {},
                  ),
                ),
              ),
              const Gap(65),
              ButtonWidget(
                  buttonText: 'Next',
                  onPressed: () {
                    Get.to(PasswordScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
