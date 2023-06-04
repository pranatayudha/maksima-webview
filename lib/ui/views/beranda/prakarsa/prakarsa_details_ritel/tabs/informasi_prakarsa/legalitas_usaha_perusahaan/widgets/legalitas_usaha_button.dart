import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../shared/styles.dart';

class LegalitasUsahaButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function? onPressed;
  final bool? isLast;

  const LegalitasUsahaButton({
    required this.icon,
    required this.label,
    this.onPressed,
    Key? key,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () => onPressed != null ? onPressed!() : null,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8.h, 0, 8.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: CustomColor.primaryOrange,
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(label, style: tsHeading10),
                      Image.asset(IconConstants.chevronRight, scale: 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!isLast!)
            Divider(
              color: const Color(0xffC8C8C8).withOpacity(0.4),
              thickness: 1.h,
            ),
        ],
      ),
    );
  }
}
