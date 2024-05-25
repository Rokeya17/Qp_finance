import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/wallet_overview.dart';
import 'package:qp_finance/presentation/utility/color.dart';

import '../utility/circular_iconbutton.dart';
import 'auth/controllers/weather_controller.dart';
import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WeatherController>().getWeather();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            CircularIconButton(
              icon: Icons.add,
              onTap: () {},
            ),
            const SizedBox(width: 8),
            CircularIconButton(
              icon: Icons.search,
              onTap: () {},
            ),
            const SizedBox(width: 8),
            CircularIconButton(
              icon: Icons.foggy,
              onTap: () {},
            ),
          ],
          bottom:  TabBar(
            tabs: [
              const Tab(
                icon: Icon(Icons.home),
              ),
              const Tab(
                icon: Icon(Icons.video_collection_outlined),
              ),
              const Tab(
                icon: Icon(Icons.wallet),
              ),
              const Tab(
                icon: Icon(Icons.notifications),
              ),
              Tab(
                icon: SizedBox(
                  width: 25,
                  height: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: primaryColor, width: 2),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        body: TabBarView(
          children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return null;
                      },
                      childCount: 6,
                    ),
                  ),
                ),
              ],
            ),
            const Center(child: Text('Videos')),
            const Center(child: WalletOverview()),
            const Center(child: Text('Notifications')),
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MenuScreen(),
                )),
          ],
        ),
      ),
    );
  }
}