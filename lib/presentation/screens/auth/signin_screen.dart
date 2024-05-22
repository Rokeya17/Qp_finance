import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/signup_screen.dart';
import 'package:qp_finance/presentation/utility/color.dart';
import 'package:qp_finance/presentation/utility/imageasset.dart';

import 'email_verification_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 88),
                Image.asset(
                  ImageAssets.applogoPNG,
                  width: 116,
                  height: 107,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 299,
                    height: 48,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Welcome to the Biggest Social Network in the World',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontFamily: 'SF Pro Text',
                          height: 23.87 / 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(5),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Login here',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                            ),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          labelText: 'Email',
                        ),
                        style: const TextStyle(height: 1.5),
                        textAlignVertical: TextAlignVertical.center,
                        minLines: 1,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordEditingController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                            ),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          labelText: 'Password',
                        ),
                        style: const TextStyle(height: 1.5),
                        textAlignVertical: TextAlignVertical.center,
                        minLines: 1,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        height: 59,
                        width: 357,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                          ),
                          onPressed: () {
                            Get.to(const EmailVerificationScreen());
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(
                          const SignupScreen(),
                        );
                      },
                      child: const Text(
                        'Create New Account',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
