import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utility/imageasset.dart';

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
                Text(
                  'Wallet Dashboard Menu',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.frameSVG),
            title: const Text('Wallet Dashboard'),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.moneySVG),
            title: const Text('Weather'),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.vectorSVG),
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
