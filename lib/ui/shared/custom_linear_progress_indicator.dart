import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double? paddingHorizontal;

  const CustomLinearProgressIndicator({
    this.paddingHorizontal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal ?? 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LinearProgressIndicator(),
          SizedBox(height: 8.h),
          Text(
            'Memuat data...',
            style: TextStyle(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
