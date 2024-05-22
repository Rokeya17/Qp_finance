import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/signin_screen.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Appbarwidget(
              title: 'Create account',
              onPressed: () {
                Get.to(const SignInScreen());
              },
            ),
            const Gap(25),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _firstNameController.clear();
                        },
                      ),
                    ),
                  ),
                  const Gap(15),
                  TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _lastNameController.clear();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(50),
            ButtonWidget(
              buttonText: 'Next',
              onPressed: () {
                Get.to(const BirthdayScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     super.dispose();
//   }
}
