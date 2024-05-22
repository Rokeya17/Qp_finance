import 'package:flutter/material.dart';
import 'package:qp_finance/presentation/screens/widgets/appbar_widget.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [AppbarWidget(title: 'Create Account', onBackPressed: () {})],
      ),
    );
  }
}
