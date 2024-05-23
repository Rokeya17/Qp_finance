import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/gender_screen.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';
import 'package:scroll_wheel_date_picker/scroll_wheel_date_picker.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  DateTime _selectedDate = DateTime.now();
  int _age = 0;

  void _calculateAge() {
    final currentDate = DateTime.now();
    int age = currentDate.year - _selectedDate.year;
    if (currentDate.month < _selectedDate.month ||
        (currentDate.month == _selectedDate.month &&
            currentDate.day < _selectedDate.day)) {
      age--;
    }
    setState(() {
      _age = age;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarwidget(
          title: 'Birthday',
          onPressed: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Text(
              'What’s your birthday?',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: 'SF Pro Display',
              ),
            ),
            Gap(10),
            Text(
              'Choose your date of birth.\n You can always make this private later.',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'SF Pro Display',
                  letterSpacing: -0.5,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            Gap(92),
            ScrollWheelDatePicker(
              onSelectedItemChanged: (DateTime da) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    _selectedDate = da;
                    _calculateAge();
                  });
                });
              },
              theme: FlatDatePickerTheme(
                backgroundColor: Colors.white,
                overlay: ScrollWheelDatePickerOverlay.holo,
                itemTextStyle:
                    defaultItemTextStyle.copyWith(color: Colors.black),
                overlayColor: Colors.black,
                overAndUnderCenterOpacity: 0.2,
              ),
            ),
            Gap(66),
            Text(
              ' $_age Years old',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro Text'),
            ),
            Gap(78),
            ButtonWidget(
                buttonText: 'Next',
                onPressed: () {
                  Get.to(GenderScreen());
                }),
          ],
        ),
      ),
    );
  }
}
