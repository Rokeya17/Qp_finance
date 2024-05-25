import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/dashboard_controller.dart';
import 'package:qp_finance/presentation/screens/widgets/walletdashboard_menu.dart';

import '../utility/imageasset.dart';

class WalletOverview extends StatefulWidget {
  const WalletOverview({super.key});

  @override
  State<WalletOverview> createState() => _WalletOverviewState();
}

class _WalletOverviewState extends State<WalletOverview> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      endDrawer: const WalletDashboardMenu(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: GetBuilder<DashboardController>(
            builder: (controller) {
              if(controller.inprogress) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Wallet Overview',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          _globalKey.currentState!.openEndDrawer();
                        },
                        icon: const Icon(Icons.view_list),
                      ),
                    ],
                  ),
                  const Gap(12),
                  const Gap(8),
                  _buildCard(
                    title: 'Current Balance',
                    amount: controller.dashboardModel.walletBalance.toString(),
                    icon: SvgPicture.asset(ImageAssets.dollarlogoSVG),
                  ), const Gap(8),
                  _buildCard(
                    title: 'Received Money',
                    amount: controller.dashboardModel.totalReceivedMoneyAmount.toString(),
                    icon: SvgPicture.asset(ImageAssets.rewardlogoSVG),
                  ),
                  const Gap(8),
                  _buildCard(
                    title: 'Send Money',
                    amount: controller.dashboardModel.totalSendMoneyAmount.toString(),
                    icon: SvgPicture.asset(ImageAssets.sendmoneylogoSVG),
                  ),
                  const Gap(8),
                  _buildCard(
                    title: 'Withdraw Money',
                    amount: controller.dashboardModel.totalWithdrawRequestAmount.toString(),
                    icon: SvgPicture.asset(ImageAssets.rdollarlogoSVG),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String amount,
    required Widget icon,
  }) {
    return Center(
      child: Container(
        height: 94,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\$$amount',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}