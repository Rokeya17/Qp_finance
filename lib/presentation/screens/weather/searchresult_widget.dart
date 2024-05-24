import 'package:flutter/material.dart';

class SearchResultsWidget extends StatelessWidget {
  final List<String> searchResults;

  const SearchResultsWidget({super.key, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          // Add onTap logic for search result item
        );
      },
    );
  }
}
