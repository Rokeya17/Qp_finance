import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:qp_finance/presentation/utility/imageasset.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildContainer(
              childLeft: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 54,
                  width: 50,
                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D'),
                ),
              ),
              childRight: const Text("Rokeya Mim")),
          Gap(10),
          _buildContainer(
            childLeft: SvgPicture.asset(ImageAssets.rewardlogoSVG),
            childRight: Text('Group'),
          ),
          Gap(5),
          _buildContainer(
            childLeft: SvgPicture.asset(ImageAssets.rewardlogoSVG),
            childRight: Text('Group'),
          ),
        ],
      ),
    );
  }

  Container _buildContainer(
      {required Widget childLeft, required Widget childRight}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [childLeft, const Gap(10), childRight],
        ),
      ),
    );
  }
}
