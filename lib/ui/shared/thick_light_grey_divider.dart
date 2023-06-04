import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThickLightGreyDivider extends StatelessWidget {
  const ThickLightGreyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
  }
}
