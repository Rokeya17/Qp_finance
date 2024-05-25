import 'package:flutter/material.dart';

class SearchresultWidget extends StatefulWidget {
  SearchresultWidget({super.key});

  @override
  _SearchresultWidgetState createState() => _SearchresultWidgetState();
}

class _SearchresultWidgetState extends State<SearchresultWidget> {
  late TextEditingController _searchController;
  String _searchText = "";
  final List<String> _dummyData = [
    'mirpur',
    'london',
    'dhaka',
    'cantonment',
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: Container(
          width: 414,
          height: 407,
          color: Colors.grey[200],
          child: Column(
            children: [
              const SizedBox(height: 24),
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

            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[

          Expanded(
            child: ListView.builder(
              itemCount: _dummyData.length,
              itemBuilder: (context, index) {
                if (_searchText.isEmpty ||
                    _dummyData[index].toLowerCase().contains(_searchText.toLowerCase())) {
                  return ListTile(
                    title: Text(_dummyData[index]),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
