import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/custom_color.dart';
import '../../../shared/custom_circular_progress_indicator.dart';
import '../../../shared/styles.dart';
import '../login_viewmodel.dart';

class LoginButton extends HookViewModelWidget<LoginViewModel> {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, LoginViewModel viewModel) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 62.h, 0, 12.h),
      height: 40.h,
      width: double.infinity,
      child: TextButton(
        onPressed: viewModel.validateInputs,
        style: TextButton.styleFrom(
          backgroundColor: CustomColor.secondaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: viewModel.isBusy
            ? const CustomCircularProgressIndicator()
            : Text('LOGIN', style: tsButtonWhite),
      ),
    );
  }
}
