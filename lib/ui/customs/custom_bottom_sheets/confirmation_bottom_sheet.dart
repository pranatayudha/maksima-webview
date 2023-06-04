import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../shared/custom_button.dart';
import '../../shared/custom_outlined_button.dart';
import '../../shared/styles.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const ConfirmationBottomSheet({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 32, 24.w, 20.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${request!.data['title']}', style: tsHeading5),
                SizedBox(height: 12.h),
                if (request!.data['description'] == null)
                  Text(
                    request!.data['firstLine'] == null
                        ? 'Apakah Anda yakin data yang diinput sudah sesuai?'
                        : request!.data['firstLine'].toString(),
                    style: tsBody6,
                  ),
                if (request!.data['description'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16.h),
                      Text('${request!.data['description']}', style: tsBody6),
                    ],
                  ),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        label: request!.data['negativeButtonText'] == null
                            ? 'BATALKAN'
                            : request!.data['negativeButtonText'].toString(),
                        height: 40.h,
                        withShadow: false,
                        labelColor: request!.data['color'] != null
                            ? request!.data['color'] as Color
                            : null,
                        borderColor: request!.data['color'] != null
                            ? request!.data['color'] as Color
                            : null,
                        elevation: 0,
                        onPressed: () => completer!(SheetResponse()),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomButton(
                        label: 'YA',
                        color: request!.data['color'] != null
                            ? request!.data['color'] as Color
                            : null,
                        onPressed: () =>
                            completer!(SheetResponse(confirmed: true)),
                        isBusy: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
