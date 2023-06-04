import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final Function onChanged;

  const SearchBar({
    required this.hintText,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 30),
      decoration: BoxDecoration(border: Border.all()),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search),
          hintText: hintText,
        ),
        onChanged: (val) => onChanged(val),
      ),
    );
  }
}
