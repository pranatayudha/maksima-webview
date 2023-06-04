import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/constants/image_constants.dart';
import '../../shared/custom_button.dart';
import '../../shared/styles.dart';

class InDevelopmentDialog extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const InDevelopmentDialog({
    this.request,
    this.completer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.blueTexturedBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, right: 10.w),
                child:
                    Image.asset(ImageConstants.pinangMaximaWhite, scale: 1.8),
              ),
            ),
            SizedBox(height: 40.h),
            Text('Upcoming', style: tsHeading4White),
            SizedBox(height: 4.h),
            Text(
              'Nantikan updatenya segera, \nhanya di Pinang Maksima!',
              style: tsBody6White,
            ),
            SizedBox(height: 20.h),
            CustomButton(
              label: 'OK',
              labelColor: const Color(0xff0F6FC2),
              radius: 8.r,
              color: Colors.white,
              onPressed: () => completer!(DialogResponse(confirmed: true)),
              isBusy: false,
            ),
          ],
        ),
      ),
    );
  }
}
