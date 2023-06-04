import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/app/constants/image_constants.dart';

class NotFound extends StatelessWidget {
  final String label;

  const NotFound({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageConstants.notFound, scale: 2),
        SizedBox(height: 40.h),
        Text(
          label,
          style: TextStyle(fontSize: 14.sp),
        ),
      ],
    );
  }
}
