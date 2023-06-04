import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/custom_color.dart';

class RitelDokumenItem extends StatelessWidget {
  final String name;
  final String url;

  const RitelDokumenItem(
    this.name,
    this.url, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 95.w,
              height: 60.h,
              color: const Color(0xff828896),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: CustomColor.primaryBlack,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Lihat',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColor.secondaryBlue,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: const Color(0xffC8C8C8).withOpacity(0.4),
          thickness: 1.h,
        ),
      ],
    );
  }
}
