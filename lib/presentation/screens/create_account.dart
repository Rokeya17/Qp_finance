import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/birthday_screen.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AppbarWidget(
            //   title: 'Create Account',
            //   onBackPressed: () {
            //     Get.back();
            //   },
            // ),
            const Divider(),
            const Gap(25),
            const Text(
              "What's your name?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                fontFamily: 'SF Pro Display',
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Enter the name you use in real life.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'SF Pro Display',
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(50),
            ButtonWidget(
              buttonText: 'Next',
              onPressed: () {
                Get.to(const BirthdayScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
