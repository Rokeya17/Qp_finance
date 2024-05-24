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
  final String email;
  final String gender;
  final String day;
  final String month;
  final String year;

  PasswordScreen(
      {Key? key,
      required this.phoneNumber,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.gender,
      required this.day,
      required this.month,
      required this.year})
      : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisibility = false;
  final _formkey = GlobalKey<FormState>();
  String? ValidPassword(String? password) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    final isPasswordValid = passwordRegex.hasMatch(password ?? '');
    if (!isPasswordValid) {
      return ' Please enter a valid password';
    }
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
                Gap(50),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !_passwordVisibility,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: ' Password',
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _passwordVisibility = !_passwordVisibility;
                        });
                      },
                    ),
                  ),
                  validator: ValidPassword,
                ),
                Gap(65),
                GetBuilder<SignupController>(builder: (controller) {
                  if (controller.inProgress) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ButtonWidget(
                    buttonText: 'Next',
                    onPressed: () {
                      _formkey.currentState!.validate();
                      controller
                          .userSignup(
                            widget.firstName,
                            widget.lastName,
                            widget.email,
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
