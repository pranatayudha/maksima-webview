import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/image_constants.dart';
import '../../../shared/styles.dart';
import '../akun_viewmodel.dart';

class DivisiAndJabatan extends HookViewModelWidget<AkunViewModel> {
  const DivisiAndJabatan({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(BuildContext context, AkunViewModel viewModel) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDivisiAndJabatanItem(
            context,
            'Divisi',
            viewModel.user!.organization!,
            ImageConstants.bagColor,
          ),
          _buildDivisiAndJabatanItem(
            context,
            'Jabatan',
            viewModel.user!.jabatan!,
            ImageConstants.personBig,
          ),
        ],
      ),
    );
  }

  Container _buildDivisiAndJabatanItem(
    BuildContext context,
    String label,
    String value,
    String imagePath,
  ) {
    return Container(
      height: 65.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [subtleBoxShadows],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10.w,
            bottom: -7.h,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(imagePath, scale: 3),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Text(label, style: tsHeading13DarkGrey),
                  SizedBox(height: 4.h),
                  SizedBox(
                    height: 28.h,
                    child: AutoSizeText(
                      value,
                      style: tsHeading5SecondaryOrange,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
