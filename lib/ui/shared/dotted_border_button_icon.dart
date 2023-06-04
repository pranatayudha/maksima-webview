import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/app/constants/icon_constants.dart';

class DottedBorderButtonIcon extends StatelessWidget {
  final String label;
  final Function? onTap;

  const DottedBorderButtonIcon({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: const Color(0xffF1F8FF),
        child: InkWell(
          onTap: onTap != null ? () => onTap!() : null,
          child: DottedBorder(
            dashPattern: const <double>[5, 4],
            radius: const Radius.circular(4),
            color: const Color(0xff027DEF),
            borderType: BorderType.RRect,
            child: SizedBox(
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    IconConstants.upload,
                    scale: 4,
                  ),
                  SizedBox(width: 11.w),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff07539A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
