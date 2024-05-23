import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/birthday_screen.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: ' First name',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _lastNameController.clear();
                          },
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
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
              const Gap(20),
              ButtonWidget(
                buttonText: 'Next',
                onPressed: () {
                  Get.to(const BirthdayScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
