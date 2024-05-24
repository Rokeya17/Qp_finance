import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/signin_controller.dart';
import 'package:qp_finance/presentation/screens/auth/signup_screen.dart';
import 'package:qp_finance/presentation/screens/home_screen.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';
import 'package:qp_finance/presentation/utility/color.dart';
import 'package:qp_finance/presentation/utility/imageasset.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailEditingController =
      TextEditingController(text: 'anik.ba@pakizatvl.com');
  final TextEditingController _passwordEditingController =
      TextEditingController(text: '12345678As@');

  Future<void> signIn(SigninController signInController) async {
    final isSucess = await signInController.userSignin(
        _emailEditingController.text.trim(), _passwordEditingController.text);
    print(isSucess);
    if (isSucess) {
      Get.offAll(const HomeScreen());
      Get.snackbar("Success", signInController.message);
    } else {
      print(isSucess);
      Get.snackbar("Error", signInController.message);
    }
  }

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
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _emailEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: focusedBorderColor, width: 2),
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
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: focusedBorderColor, width: 2),
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
                      const Gap(30),
                      GetBuilder<SigninController>(builder: (controller) {
                        if (controller.inprogress) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ButtonWidget(
                            buttonText: 'Sign in',
                            onPressed: () {
                              signIn(controller);
                            });
                      }),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.offAll(const SignUpScreen());
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
