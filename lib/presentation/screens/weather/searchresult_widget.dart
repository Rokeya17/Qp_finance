import 'package:flutter/material.dart';

class SearchResultWidget extends StatelessWidget {
  final String searchValue;
  final List<String> suggestions;

  const SearchResultWidget({
    Key? key,
    required this.searchValue,
    required this.suggestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> filteredSuggestions = suggestions
        .where((suggestion) =>
        suggestion.toLowerCase().contains(searchValue.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        final suggestion = filteredSuggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {

          },
        );
      },
    );
  }
}
