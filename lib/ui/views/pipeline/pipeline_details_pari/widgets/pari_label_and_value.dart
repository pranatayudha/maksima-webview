import 'package:flutter/material.dart';

class PariLabelAndValue extends StatelessWidget {
  final String label;
  final String value;

  const PariLabelAndValue(
    this.label,
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff828896),
          ),
        ),
        const SizedBox(height: 1.0),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff162B3A),
          ),
        ),
      ],
    );
  }
}
