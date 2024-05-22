import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;

  const AppbarWidget({
    Key? key,
    required this.title,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
      elevation: 4,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: onBackPressed,
      ),
    );
  }
}
