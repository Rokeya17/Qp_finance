import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              Text(
                'Choose your date of birth.\n You can always make this private later.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'SF Pro Display',
                ),
                textAlign: TextAlign.center,
              ),
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
                'Age: $_age',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Gap(78),
              ButtonWidget(buttonText: 'Next', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
