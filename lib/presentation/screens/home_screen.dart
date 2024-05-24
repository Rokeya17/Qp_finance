import 'package:flutter/material.dart';
import 'package:qp_finance/presentation/screens/wallet_overview.dart';

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
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.video_collection_outlined),
              ),
              Tab(
                icon: Icon(Icons.wallet),
              ),
              Tab(
                icon: Icon(Icons.notifications),
              ),
              Tab(
                icon: CircleAvatar(),
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
