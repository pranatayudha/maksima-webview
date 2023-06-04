import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataNavigator extends StatelessWidget {
  final String? prefix;
  final int index;
  final int length;
  final ValueChanged<int> onChanged;

  const DataNavigator({
    Key? key,
    required this.prefix,
    required this.index,
    required this.onChanged,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: index > 0,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: GestureDetector(
              onTap: () => onChanged.call(index - 1),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '${prefix ?? 'Data'} ${index + 1}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Visibility(
            visible: index < length - 1,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: GestureDetector(
              onTap: () => onChanged.call(index + 1),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
