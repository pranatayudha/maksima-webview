import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../shared/styles.dart';

class LabelAndValue extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;
  final bool isHighlight;

  const LabelAndValue(
    this.label,
    this.value, {
    this.isTotal = false,
    this.isHighlight = false,
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
              style: TextStyle(
                color: isHighlight ? CustomColor.primaryOrange : Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: isTotal ? 20.sp : 14.sp,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
