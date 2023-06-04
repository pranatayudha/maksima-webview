import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/styles.dart';

class StatsHorizCard extends StatelessWidget {
  final Widget child;

  const StatsHorizCard({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290.w,
      height: 203.w,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 18),
      margin: EdgeInsets.only(right: 12.w, bottom: 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [subtleBoxShadows],
      ),
      child: child,
    );
  }
}
