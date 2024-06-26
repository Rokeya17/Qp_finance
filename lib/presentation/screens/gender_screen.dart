import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/emailaddress_screen.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';
import 'package:qp_finance/presentation/utility/color.dart';

class GenderScreen extends StatefulWidget {
  final String date;
  final String year;
  final String month;
  final String firstName;
  final String lastName;

  GenderScreen({
    Key? key,
    required this.date,
    required this.year,
    required this.month,
    required this.firstName,
    required this.lastName,
  });

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String _selectedGender = '';
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
        title: 'Gender',
        onPressed: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'What’s your gender?',
                style: TextStyle(
                  letterSpacing: -0.5,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'You can change who sees your gender on your profile later.',
                style: TextStyle(
                  letterSpacing: -0.5,
                  fontSize: 12,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(70),
              _buildGenderOption('Female'),
              _buildGenderOption('Male'),
              _buildGenderOption('Custom',
                  label:
                  "Select custom to choose another gender,\n or if you’d rather not say"),
              const Gap(164),
              ButtonWidget(
                buttonText: 'Next',
                onPressed: _isButtonEnabled
                    ? () {
                  Get.to(EmailaddressScreen(
                    gender: '65018b21577b4590853ef574',
                    firstName: widget.firstName,
                    lastName: widget.lastName,
                    day: widget.date,
                    year: widget.year,
                    month: widget.month,
                  ));
                }
                    : () {},

              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender, {label}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
          _isButtonEnabled = true;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(),
            ),
          ),
          child: ListTile(
            title: Text(
              gender,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                letterSpacing: -0.5,
              ),
            ),
            trailing: _buildTrailingIcon(gender),
            subtitle: label != null
                ? Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            )
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildTrailingIcon(String gender) {
    if (gender == _selectedGender) {
      return const Icon(
        Icons.radio_button_checked,
        color: primaryColor,
      );
    } else {
      return const Icon(
        Icons.radio_button_unchecked,
        color: Colors.grey,
      );
    }
  }
}
