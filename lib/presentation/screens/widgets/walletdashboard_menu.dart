import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/signin_screen.dart';
import 'package:qp_finance/presentation/screens/weather/weather_screen.dart';

import '../../utility/imageasset.dart';
import '../auth/controllers/logout_controller.dart';

class WalletDashboardMenu extends StatelessWidget {
  const WalletDashboardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final LogoutController logoutController = Get.put(LogoutController());

    return Drawer(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
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
              Get.to(const WeatherScreen());
            },
          ),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.vectorSVG),
            title: const Text('Log Out'),
            onTap: () async {
              bool success = await logoutController.logout();
              if (success) {
                Get.offAll(const SignInScreen());
              } else {
                Get.snackbar('Error', logoutController.message,
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
          ),
        ],
      ),
    );
  }
}
