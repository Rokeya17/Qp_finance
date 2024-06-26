import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/phone_number_screen.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';

class EmailaddressScreen extends StatelessWidget {
  final String gender;
  final String firstName;
  final String lastName;
  final String day;
  final String month;
  final String year;
  EmailaddressScreen(
      {super.key,
      required this.gender,
      required this.firstName,
      required this.lastName,
      required this.day,
      required this.month,
      required this.year});
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@gmail.com$',
    );
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid Gmail address';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
          title: 'Email address',
          onPressed: () {
            Get.back();
          }),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formkey,
            child: Column(
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
                const Gap(50),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: ' Email address',
                    labelStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _emailController.clear();
                      },
                    ),
                  ),
                  validator: validateEmail,
                ),
                const Gap(65),
                ButtonWidget(
                    buttonText: 'Next',
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Get.to(PhoneNumberScreen(
                        email: _emailController.text.trim(),
                        firstName: firstName,
                        lastName: lastName,
                        gender: gender,
                        day: day,
                        month: month,
                        year: year,
                      ));
                    }
                  }

                ),],
            ),
          ),
        ),
      ),
    );
  }
}
