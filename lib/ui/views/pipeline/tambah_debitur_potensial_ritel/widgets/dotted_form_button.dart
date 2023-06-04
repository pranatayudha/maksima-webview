import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/app/constants/custom_color.dart';
import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../shared/styles.dart';

class DottedFormButton extends StatelessWidget {
  final String label;
  final String? iconPath;
  final int completed;
  final Function onTap;
  final bool enabled;
  final double? scale;

  const DottedFormButton({
    required this.label,
    this.iconPath,
    required this.onTap,
    required this.completed,
    required this.enabled,
    this.scale = 3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w),
          child: Container(
            height: 18.5.w,
            width: 18.5.w,
            decoration: BoxDecoration(
              color: completed == 2
                  ? CustomColor.checkedGreen
                  : completed == 1
                      ? CustomColor.yellow
                      : Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: completed == 2
                    ? CustomColor.checkedGreen
                    : completed == 1
                        ? CustomColor.yellow
                        : CustomColor.darkGrey,
              ),
            ),
            child: Center(
              child: Icon(
                completed == 2
                    ? Icons.check
                    : completed == 1
                        ? Icons.warning_amber_rounded
                        : null,
                color: Colors.white,
                size: 14.sp,
              ),
            ),
          ),
        ),
        Expanded(
          child: Material(
            child: Ink(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: InkWell(
                  onTap: enabled ? () => onTap() : null,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              if (iconPath != null)
                                Opacity(
                                  opacity: enabled ? 1 : 0.3,
                                  child: Image.asset(iconPath!, scale: scale),
                                ),
                              SizedBox(width: 15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    label,
                                    style: enabled
                                        ? tsHeading10
                                        : tsHeading10DarkGrey,
                                  ),
                                  // Text(description!, style: tsCaption1),
                                ],
                              ),
                            ],
                          ),
                          Opacity(
                            opacity: enabled ? 1 : 0.3,
                            child: Image.asset(
                              IconConstants.chevronRight,
                              scale: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
