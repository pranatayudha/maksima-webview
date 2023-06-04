import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 58.w),
      child: Divider(
        color: const Color(0xffC8C8C8).withOpacity(0.4),
        height: 37.h,
        thickness: 1.h,
      ),
    );
  }
}
