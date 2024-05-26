import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/gender_screen.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';
import 'package:scroll_wheel_date_picker/scroll_wheel_date_picker.dart';

class BirthdayScreen extends StatefulWidget {
  final String firstName;
  final String lastName;

  const BirthdayScreen(
      {Key? key, required this.firstName, required this.lastName});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  DateTime? _selectedDate;
  int _age = 0;

  void _calculateAge() {
    if (_selectedDate != null) {
      final currentDate = DateTime.now();
      int age = currentDate.year - _selectedDate!.year;
      if (currentDate.month < _selectedDate!.month ||
          (currentDate.month == _selectedDate!.month &&
              currentDate.day < _selectedDate!.day)) {
        age--;
      }
      if (age < 0) {
        age = 0;
      }
      setState(() {
        _age = age;
      });
    }
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
            const Text(
              'What’s your birthday?',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: 'SF Pro Display',
              ),
            ),
            const Gap(10),
            const Text(
              'Choose your date of birth.\n You can always make this private later.',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'SF Pro Display',
                  letterSpacing: -0.5,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const Gap(92),
            ScrollWheelDatePicker(
              lastDate: DateTime(DateTime.now().year + 1),
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
            const Gap(66),
            Text(
              _selectedDate != null
                  ? ' $_age Years old'
                  : 'Please select your birthday',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro Text'),
            ),
            const Gap(78),
            ButtonWidget(
              buttonText: 'Next',
              onPressed: _selectedDate != null &&
                      _selectedDate!.isBefore(DateTime.now())
                  ? () {
                      Get.to(GenderScreen(
                        date: _selectedDate!.day.toString(),
                        year: _selectedDate!.year.toString(),
                        month: _selectedDate!.month.toString(),
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                      ));
                    }
                  : () {}, // Providing a default empty function
            ),
          ],
        ),
      ),
    );
  }
}
