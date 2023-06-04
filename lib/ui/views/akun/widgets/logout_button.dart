import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../shared/styles.dart';
import '../akun_viewmodel.dart';

class LogoutButton extends HookViewModelWidget<AkunViewModel> {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    AkunViewModel viewModel,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 28.h, 0, 12.h),
      child: SizedBox(
        width: double.infinity,
        height: 40.h,
        child: OutlinedButton(
          onPressed: viewModel.logout,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: const BorderSide(
              color: Color.fromRGBO(242, 63, 63, 0.8),
            ),
          ),
          child: Text(
            'Log Out',
            style: tsButtonSecondaryRed,
          ),
        ),
      ),
    );
  }
}
