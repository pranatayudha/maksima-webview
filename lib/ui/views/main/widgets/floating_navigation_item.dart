import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../application/app/constants/custom_color.dart';
import '../../../shared/styles.dart';

class FloatingNavigationItem extends StatelessWidget {
  final bool isSelected;
  final String iconPath;
  final String label;
  final Function onTap;

  const FloatingNavigationItem({
    required this.isSelected,
    required this.iconPath,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? CustomColor.lightBlue : null,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  iconPath,
                  fit: BoxFit.fitHeight,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
            Text(
              label,
              style: isSelected ? tsHeading12White : tsHeading12OWhite60,
            ),
          ],
        ),
      ),
    );
  }
}
