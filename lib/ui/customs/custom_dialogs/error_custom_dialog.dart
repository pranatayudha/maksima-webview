import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../shared/custom_button.dart';

class ErrorCustomDialog extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const ErrorCustomDialog({
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: [
                    const Icon(Icons.warning, color: Colors.red),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        request!.title!,
                        style: TextStyle(
                          fontSize:
                              request!.title!.length > 20.sp ? 18.sp : 24.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.8.w,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  request!.description!,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  label: request!.mainButtonTitle!,
                  radius: 8.r,
                  isBusy: false,
                  onPressed: () => completer!(DialogResponse(confirmed: true)),
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
