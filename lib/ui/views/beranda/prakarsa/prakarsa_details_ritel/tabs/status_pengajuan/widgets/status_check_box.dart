import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../application/app/constants/custom_color.dart';

class StatusCheckBox extends StatelessWidget {
  final bool isCurrentTask;
  final bool? isDone;
  final bool isFailed;
  final bool showTextButton;
  final bool isLast;
  final bool isCorrection;
  final bool forceVisibleTextButton;
  final double? lineHeight;

  const StatusCheckBox(
    this.isCurrentTask,
    this.isFailed, {
    this.isDone,
    required this.showTextButton,
    this.isLast = false,
    this.isCorrection = false,
    this.forceVisibleTextButton = false,
    this.lineHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: 18.5.w,
              width: 18.5.w,
              decoration: BoxDecoration(
                // ignore: no-boolean-literal-compare
                color: isFailed == true
                    ? CustomColor.secondaryRed60
                    : isCurrentTask
                        ? CustomColor.yellow40
                        : isDone == true
                            ? CustomColor.secondaryGreen60
                            : Colors.transparent,
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: isDone == true || isFailed
                      ? Colors.transparent
                      : CustomColor.borderGrey,
                ),
              ),
              child: Center(
                child: isCurrentTask
                    ? null
                    : Icon(
                        isFailed
                            ? Icons.clear
                            : isDone == true
                                ? Icons.check
                                : Icons.clear,
                        color: Colors.white,
                        size: 12.5.sp,
                      ),
              ),
            ),
            if (isCurrentTask)
              Container(
                height: 18.5.w,
                width: 18.5.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: CustomColor.yellow,
                  ),
                ),
                child: Container(
                  height: 18.5.w,
                  width: 18.5.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.5.w,
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (!isLast)
          Container(
            width: 1.w,
            height: lineHeight != null ? lineHeight! + 18.h : 18.h,
            color: CustomColor.borderGrey,
          ),
      ],
    );
  }
}
