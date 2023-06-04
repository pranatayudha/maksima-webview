import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../shared/custom_button.dart';
import '../../../../../shared/custom_outlined_button.dart';
import '../../../../../shared/styles.dart';
import '../../../../../shared/thick_light_grey_divider.dart';
import 'hasil_foto_viewmodel.dart';

class HasilFotoView extends ViewModelBuilderWidget<HasilFotoViewModel> {
  final File imageFile;

  const HasilFotoView(this.imageFile, {Key? key}) : super(key: key);

  @override
  HasilFotoViewModel viewModelBuilder(BuildContext context) =>
      HasilFotoViewModel(imageFile);

  @override
  Widget builder(
    BuildContext context,
    HasilFotoViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context, viewModel),
      body: _buildBody(context, viewModel),
    );
  }

  AppBar _buildAppBar(BuildContext context, HasilFotoViewModel vm) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text('Hasil Foto', style: tsHeading6),
      centerTitle: true,
      leading: Container(
        padding: EdgeInsets.zero,
        width: 30.w,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color(0xff606060),
            size: 24.sp,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  SafeArea _buildBody(BuildContext context, HasilFotoViewModel vm) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
            child: Text(
              'Pastikan hasil foto jelas, tidak buram dan semua tulisan dapat dibaca dengan baik.',
              style: tsDescription,
            ),
          ),
          const ThickLightGreyDivider(),
          Padding(
            padding: EdgeInsets.fromLTRB(20.h, 33.h, 20.w, 16.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40.w,
                height: MediaQuery.of(context).size.width - 40.w,
                child: Image.file(vm.imageFile!, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 30.h),
            child: Column(
              children: [
                CustomButton(
                  label: 'GUNAKAN FOTO',
                  radius: 8.r,
                  isBusy: vm.isBusy,
                  onPressed: vm.gunakanFoto,
                ),
                const SizedBox(height: 16),
                CustomOutlinedButton(
                  label: 'FOTO ULANG',
                  withShadow: false,
                  elevation: 0,
                  radius: 8.r,
                  labelSize: 16.sp,
                  onPressed: vm.fotoUlang,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
