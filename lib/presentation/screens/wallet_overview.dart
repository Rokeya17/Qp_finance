import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:qp_finance/presentation/screens/widgets/walletdashboard_menu.dart';
import 'package:qp_finance/presentation/utility/imageasset.dart';

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
          child: Column(
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
                      print('Button tapped');
                      _globalKey.currentState!.openEndDrawer();
                    },
                    icon: const Icon(Icons.view_list),
                  ),
                ],
              ),
              const Gap(12),
              _buildCard(
                title: 'Current Balance',
                amount: '\$40,689',
                svgPath: ImageAssets.dollarlogoSVG,
              ),
              const Gap(8),
              _buildCard(
                title: 'Reward Balance',
                amount: '\$40,689',
                svgPath: ImageAssets.rewardlogoSVG,
              ),
              const Gap(8),
              _buildCard(
                title: 'Send Money',
                amount: '\$1.5',
                svgPath: ImageAssets.sendmoneylogoSVG,
              ),
              const Gap(8),
              _buildCard(
                title: 'Withdraw Money',
                amount: '\$40,689',
                svgPath: ImageAssets.withdrawlogoSVG,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
      {required String title,
      required String amount,
      required String svgPath}) {
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
                    amount,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(svgPath),
            ],
          ),
        ),
      ),
    );
  }
}