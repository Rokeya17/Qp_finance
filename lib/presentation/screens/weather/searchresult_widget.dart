import 'package:flutter/material.dart';

class StandardSearchBar extends StatefulWidget {
  final double width;
  final List<String> suggestions;

  const StandardSearchBar({super.key, required this.width, required this.suggestions, required String searchValue});



  @override
  _StandardSearchBarState createState() => _StandardSearchBarState();
}

class _StandardSearchBarState extends State<StandardSearchBar> {
  String _query = '';
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _controller.clear();
                _query = '';
              });
            },
          ),
        ),
        onChanged: (value) {
          setState(() {
            _query = value;
          });
        },
      ),
    );
  }
}
