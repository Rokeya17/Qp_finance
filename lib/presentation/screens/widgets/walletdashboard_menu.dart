import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class WalletDashboardMenu extends StatelessWidget {
  const WalletDashboardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back),
                Gap(2),
                Text('Wallet Dashboard Menu'),
              ],
            ),
          ),
          ListTile(
            title: const Text('Wallet Dashboard'),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            title: const Text('Weather'),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            title: const Text('Log Out'),
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
