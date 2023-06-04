import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/app/constants/image_constants.dart';
import '../../../shared/app_bar_widget.dart';
import 'bantuan_viewmodel.dart';

class BantuanView extends ViewModelBuilderWidget<BantuanViewModel> {
  const BantuanView({Key? key}) : super(key: key);

  @override
  BantuanViewModel viewModelBuilder(BuildContext context) => BantuanViewModel();

  @override
  Widget builder(
    BuildContext context,
    BantuanViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBarWidget.titleWithBackButton(
        title: 'Bantuan',
        color: Colors.white,
        onBackButtonTapped: viewModel.navigateBack,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  const Color(0xffFAFBFE).withOpacity(0.1),
                  const Color(0xffADC3F2).withOpacity(0.1),
                  const Color(0xff7095E7).withOpacity(0.15),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildCSImage(),
                  _buildTitleAndDescription(),
                  _buildCallCenter(viewModel),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildCSImage() {
    return SizedBox(
      height: 162.w,
      width: 162.w,
      child: Image.asset(ImageConstants.customerService),
    );
  }

  Container _buildTitleAndDescription() {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      child: Column(
        children: [
          Text(
            'Butuh bantuan lebih lanjut?',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 7.h),
          Text(
            'Hubungi call center atau \nkirim email tertera di bawah ini',
            style: TextStyle(fontSize: 14.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container _buildCallCenter(BantuanViewModel vm) {
    return Container(
      margin: EdgeInsets.only(top: 31.h),
      child: Column(
        children: [
          Text(
            'Call Center:',
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 10.h),
          GestureDetector(
            onTap: vm.callCallCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16.w,
                  width: 16.w,
                  child: Image.asset(ImageConstants.phone),
                ),
                SizedBox(width: 6.w),
                Text(
                  '1500 494',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffD45B44),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            'Email:',
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 4.h),
          GestureDetector(
            onTap: vm.emailHumasBankRaya,
            child: Text(
              'humas@bankraya.co.id',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff003481),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
