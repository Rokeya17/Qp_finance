import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/signup_controller.dart';
import 'package:qp_finance/presentation/screens/home_screen.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';

class PasswordScreen extends StatefulWidget {
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String userEmail; // Change the parameter name to avoid conflict
  final String gender;
  final String day;
  final String month;
  final String year;

  PasswordScreen(
      {super.key,
        required this.phoneNumber,
        required this.firstName,
        required this.lastName,
        required this.userEmail,
        required this.gender,
        required this.day,
        required this.month,
        required this.year, required String email});



  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisibility = false;
  final _formkey = GlobalKey<FormState>();
  String? ValidPassword(String? password) {
    RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    final isPasswordValid = passwordRegex.hasMatch(password ?? '');
    if (!isPasswordValid) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and be at least 8 characters long.';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
        title: 'Password',
        onPressed: () {
          Get.back();
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Enter your Password',
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
                  'Password must contain at least one uppercase letter,\n one lowercase letter, one number, and one symbol.',
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
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_passwordVisibility,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: ' Password',
                    labelStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _passwordVisibility = !_passwordVisibility;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else {
                      return ValidPassword(value);
                    }
                  },
                ),

                const Gap(65),
                GetBuilder<SignupController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ButtonWidget(
                    buttonText: 'Next',
                    onPressed: () {
                      _formkey.currentState!.validate();
                      controller
                          .userSignup(
                            widget.firstName,
                            widget.lastName,
                            widget.userEmail,
                            widget.phoneNumber,
                            _passwordController.text,
                            widget.gender,
                            widget.day,
                            widget.month,
                            widget.year,
                          )
                          .then((value) => {
                                if (value)
                                  {
                                    Get.offAll(const HomeScreen()),
                                    Get.snackbar("Success", controller.message)
                                  }
                                else
                                  {
                                    print(value),
                                    Get.snackbar("Error", controller.message)
                                  }
                              });
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
