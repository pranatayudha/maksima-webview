import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/helpers/ui_helpers.dart';
import '../../../shared/custom_circle_avatar.dart';
import '../../../shared/styles.dart';
import '../akun_viewmodel.dart';

class AkunHeader extends HookViewModelWidget<AkunViewModel> {
  final bool showBackArrowButton;

  const AkunHeader({
    Key? key,
    required this.showBackArrowButton,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    AkunViewModel viewModel,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: akunHeaderHeight,
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.only(top: 44.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showBackArrowButton)
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: EdgeInsets.only(left: 16.w),
                          child: Icon(Icons.arrow_back, size: 30.sp),
                        ),
                      ),
                    Expanded(
                      child: Container(
                        margin: showBackArrowButton
                            ? EdgeInsets.only(right: 50.w)
                            : null,
                        child: Text(
                          'Akun',
                          style: tsHeading4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: statusBarHeight(context) + 84.h),
                child: CustomCircleAvatar(
                  viewModel.user!.foto,
                  outerRadius: 40.r,
                  innerRadius: 40.r,
                ),
              ),
            ],
          ),
          SizedBox(height: 17.h),
          Text(
            viewModel.user!.userName!,
            style: tsHeading8,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 1.h),
          Text(
            'ID: ${viewModel.user!.userId!}',
            style: tsHeading12DarkGrey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
