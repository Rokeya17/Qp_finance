import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qp_finance/presentation/screens/auth/controllers/weather_controller.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

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
          Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(height: 52),
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Search...',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Icon(Icons.mic),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              _showSearchList
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          return buildWeatherInfoContainer(
                            date: _searchResults[index],
                            location: _searchResults[index],
                            aqi: _searchResults[index],
                            temperature: _searchResults[index],
                          );
                        },
                      ),
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Manage Cities',
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.list),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        buildWeatherInfoContainer(
                          date: 'Today, 12 September',
                          location: 'Dhaka',
                          aqi: 'AQI 29',
                          temperature: controller.weatherModel.main!.tempMax
                                  .toString() ??
                              'maxtemp',
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
        );
      }),
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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.location_on_outlined),
              SizedBox(width: 5),
              Text(
                location,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 10),
              Text(
                aqi + ' ' + temperature,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
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
        'Today, 12 September',
        'Dhaka',
        'AQI 29',
        '32° / 21°',
      ];
    });
  }
}
