import 'package:flutter/material.dart';
import 'package:qp_finance/presentation/screens/widgets/appbarwidget.dart';
import 'package:qp_finance/presentation/utility/button_widget.dart';

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appbarwidget(title: 'Birthday', onPressed: () {}),
          Text('What’s your birthday?',),
          ButtonWidget(buttonText: 'Next', onPressed: () {}),
        ],
      ),
    );
  }
}
