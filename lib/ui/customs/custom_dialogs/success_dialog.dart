import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/constants/custom_color.dart';
import '../../shared/custom_button.dart';

class SuccessDialog extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const SuccessDialog({
    this.request,
    this.completer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50.w),
                Text(
                  request!.description!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 30.sp),
                CustomButton(
                  label: request!.mainButtonTitle!,
                  color: CustomColor.secondaryGreen,
                  radius: 8.r,
                  onPressed: () => completer!(DialogResponse(confirmed: true)),
                  isBusy: false,
                ),
              ],
            ),
          ),
          Positioned(
            top: -48.h,
            child: CircleAvatar(
              minRadius: 48.r,
              maxRadius: 48.r,
              backgroundColor: CustomColor.secondaryGreen,
              child: Icon(
                Icons.check,
                size: 64.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
