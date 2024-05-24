import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/birthday_screen.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';
import 'package:qp_finance/presentation/utility/color.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _fromkey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
        title: 'Create account',
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _fromkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "What's your name?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(10),
                const Text(
                  'Enter the name you use in real life.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: 'SF Pro Display',
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(50),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: ' First name',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: primaryColor,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _lastNameController.clear();
                            },
                          ),
                        ),
                        validator: (name) => name!.length < 3
                            ? "Name should be atleast 3 characters"
                            : null,
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: primaryColor,
                          ),
                          border: const UnderlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _lastNameController.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(61),
                ButtonWidget(
                  buttonText: 'Next',
                  onPressed: () {
                    _fromkey.currentState!.validate();
                    Get.to(BirthdayScreen(
                      firstName: _firstNameController.text.trim(),
                      lastName: _lastNameController.text.trim(),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
