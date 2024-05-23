import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/home_screen.dart';

import '../utility/button_widget.dart';
import 'widgets/appbarwidget.dart';

class PasswordScreen extends StatefulWidget {
  PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisibility = false;

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
                  labelText: ' Phone Number',
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
              ),
              Gap(65),
              ButtonWidget(
                buttonText: 'Next',
                onPressed: () {
                  Get.to(HomeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
