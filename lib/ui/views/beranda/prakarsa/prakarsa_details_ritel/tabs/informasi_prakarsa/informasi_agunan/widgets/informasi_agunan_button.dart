import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../shared/styles.dart';

class InformasiAgunanButton extends StatelessWidget {
  final String label;
  final Function? onPressed;
  final bool? isLast;

  const InformasiAgunanButton({
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
                Image.asset(IconConstants.paper, scale: 2.5),
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
