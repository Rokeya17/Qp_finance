import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/signin_screen.dart';
import 'package:qp_finance/presentation/screens/create_account.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';

import '../../utility/color.dart';
import '../../utility/imageasset.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
          title: 'Create account',
          onPressed: () {
            Get.to(const SignInScreen());
          }),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageAssets.signupInfo,
                    fit: BoxFit.cover,
                    width: 278.6,
                    height: 218,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Join Quantum possibilities",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: -0.5,
                      fontFamily: 'SF Pro Display',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'We’ll help you',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      letterSpacing: -0.5,
                      fontFamily: 'SF Pro Display',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(5),
                  const Text(
                    'create a new account in a few easy steps.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      letterSpacing: -0.5,
                      fontFamily: 'SF Pro Display',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(80),
                  SizedBox(
                    height: 54,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        Get.to(const CreateAccount());
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Gap(80),
                  TextButton(
                    onPressed: () {
                      Get.to(const SignInScreen());
                    },
                    child: const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: primaryColor,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
