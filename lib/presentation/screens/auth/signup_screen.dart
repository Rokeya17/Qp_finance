import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/signin_screen.dart';
import 'package:qp_finance/presentation/screens/create_account.dart';
import 'package:qp_finance/presentation/screens/widgets/appbar_widget.dart';
import 'package:qp_finance/presentation/screens/widgets/button_widget.dart';
import 'package:qp_finance/presentation/utility/imageasset.dart';

import '../../utility/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'Create account',
      //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      //   ),
      //   // elevation: 4,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios, color: Colors.black),
      //     onPressed: () {
      //       Get.to(SignInScreen());
      //     },
      //   ),
      // ),
      body: Center(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppbarWidget(title: 'Create account', onBackPressed: () {}),
                const Divider(),
                Positioned(
                  width: 278.6,
                  height: 218,
                  top: 112,
                  left: 30,
                  child: SvgPicture.asset(
                    ImageAssets.signupSVG,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  width: 261.81,
                  height: 170.93,
                  top: 159.07,
                  left: 99.19,
                  child: SvgPicture.asset(
                    ImageAssets.signup2SVG,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Join Quantum possibilities",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'We’ll help you',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const Gap(5),
                const Text(
                  'create a new account in a few easy steps.',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const Gap(80),
                SizedBox(
                  height: 54,
                  width: 300,
                  child: ButtonWidget(
                    buttonText: 'Next',
                    onPressed: () {
                      Get.to(const CreateAccount());
                    },
                  ),
                ),
                const Gap(80),
                TextButton(
                  onPressed: () {
                    Get.offAll(const SignInScreen());
                  },
                  child: const Text(
                    'Already have an account?',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
