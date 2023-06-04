import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/constants/custom_color.dart';
import '../../shared/custom_button.dart';

class BaseCustomDialog extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const BaseCustomDialog({
    this.request,
    this.completer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Stack(
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
              children: <Widget>[
                Text(
                  request!.title!,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.8.w,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(request!.description!, style: TextStyle(fontSize: 14.sp)),
                SizedBox(height: 30.h),
                CustomButton(
                  label: request!.mainButtonTitle!,
                  color: request!.data != null
                      ? request!.data['color'] as Color
                      : CustomColor.secondaryBlue,
                  radius: 8.r,
                  onPressed: () => completer!(DialogResponse(confirmed: true)),
                  isBusy: false,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => completer!(DialogResponse()),
            ),
          ),
        ],
      ),
    );
  }
}
