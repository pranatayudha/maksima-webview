import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/styles.dart';

class LabelAndValue extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const LabelAndValue(
    this.label,
    this.value, {
    this.isTotal = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: tsDarkGrey),
          SizedBox(width: 20.w),
          Expanded(
            child: Text(
              value,
              style: !isTotal ? tsBody4 : tsHeading5SecondaryOrange,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
