import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../shared/upload_item_button_ritel.dart';
import '../informasi_pengurus_viewmodel.dart';

class PTUploadSection extends HookViewModelWidget<InformasiPengurusViewModel> {
  const PTUploadSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 24.h, top: 25.h),
            child: Text(
              'UPLOAD FILE',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5.w,
              ),
            ),
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoKtpPengurusPtPublicUrl,
            label: 'Foto E-KTP Pengurus *',
            // ignore: no-empty-block
            onPressed: () {},
            errorText: viewModel.fotoKtpPengurusPtErrorText,
            enabled: false,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoNpwpPengurusPublicUrl,
            label: 'NPWP Pengurus *',
            onPressed: viewModel.fotoNpwpPengurusPublicUrl == null
                ? viewModel.captureNpwpPengurusPt
                : viewModel.clearNpwpPengurusPt,
            errorText: viewModel.fotoNpwpPengurusErrorText,
          ),
        ],
      ),
    );
  }
}
