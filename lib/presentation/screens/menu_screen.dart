import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/utility/imageasset.dart';

import 'auth/controllers/logout_controller.dart';
import 'auth/signin_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  final LogoutController logoutController = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                childRight: const Text("Rokeya Yasmin Mim")),
            const Gap(10),
            _buildContainer(
              childLeft: SvgPicture.asset(ImageAssets.groupSVG),
              childRight:
                  const Text('Group', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            const Gap(5),
            _buildContainer(
              childLeft: SvgPicture.asset(ImageAssets.pageSVG),
              childRight:
                  const Text('Page', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            const Gap(5),
            _buildContainer(
              childLeft: SvgPicture.asset(ImageAssets.adsSVG),
              childRight: const Text('Ads Manager',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            const Gap(5),
            _buildContainer(
              childLeft: SvgPicture.asset(ImageAssets.pageSVG),
              childRight: const Text('Marketplace',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            const Gap(5),
            _buildContainer(
              childLeft: SvgPicture.asset(ImageAssets.adsSVG),
              childRight: const Text(
                'video',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 330,
              height: 34,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'See more',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
              height: 145,
              width: 330,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            ImageAssets.settingdSVG,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Settings & privacy',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            ImageAssets.feedbackSVG,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Give us Feedback',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          bool success = await logoutController.logout();
                          if (success) {
                            Get.offAll(const SignInScreen());
                          } else {
                            Get.snackbar('Error', logoutController.message,
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                        icon: SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            ImageAssets.logoutSVG,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
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
          width: 2,
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
