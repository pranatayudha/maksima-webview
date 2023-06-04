import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String label;
  final int index;
  final int currentIndex;
  final Function onTap;

  const TabItem({
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: index == currentIndex
                  ? Colors.black
                  : Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            height: 3,
            width: (MediaQuery.of(context).size.width / 2) - 55,
            color: index == currentIndex ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
