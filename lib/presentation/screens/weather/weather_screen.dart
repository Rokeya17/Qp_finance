import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/weather_controller.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _showSearchList = false;
  List<String> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: GetBuilder<WeatherController>(builder: (controller) {
        if (controller.inprogress) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 52),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showSearchList = true;
                    });
                    _performSearch(_searchController.text);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Open top drawer
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: const Icon(Icons.search),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Search...',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600]?.withOpacity(1),
                            ),
                          ),
                        ),
                        const Icon(Icons.mic),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _showSearchList
                    ? Expanded(
                  child: ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_searchResults[index]),
                        onTap: () {
                          // Do something when a search result is tapped
                        },
                      );
                    },
                  ),
                )
                    : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          'Manage Cities',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        IconButton(
                          onPressed:(){} ,
                          icon: Icon(Icons.list),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    buildWeatherInfoContainer(
                      date: 'Today, 12 September',
                      location: 'Dhaka',
                      aqi: 'AQI 29',
                      temperature: controller.weatherModel.main?.tempMax.toString() ?? 'maxtemp',
                    ),
                    buildWeatherInfoContainer(
                      date: 'Today, 12 September',
                      location: 'Dhaka',
                      aqi: 'AQI 29',
                      temperature: '32° / 21°',
                    ),
                    buildWeatherInfoContainer(
                      date: 'Today, 12 September',
                      location: 'Dhaka',
                      aqi: 'AQI 29',
                      temperature: '32° / 21°',
                    ),
                    buildWeatherInfoContainer(
                      date: 'Today, 12 September',
                      location: 'Dhaka',
                      aqi: 'AQI 29',
                      temperature: '32° / 21°',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Display search results here
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_searchResults[index]),
                      onTap: () {

                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWeatherInfoContainer({
    required String date,
    required String location,
    required String aqi,
    required String temperature,
  }) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              const SizedBox(width: 5),
              Text(
                location,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 10),
              Text(
                aqi + ' ' + temperature,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _performSearch(String query) {
    setState(() {
      _searchResults = [
        'Dhaka',
        'Mirpur',

      ];
    });
  }
}
