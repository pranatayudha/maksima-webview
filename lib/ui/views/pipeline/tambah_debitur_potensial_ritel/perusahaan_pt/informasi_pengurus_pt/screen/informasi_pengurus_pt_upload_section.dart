import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../shared/upload_item_button_ritel.dart';
import '../informasi_pengurus_pt_viewmodel.dart';

class InformasiPengurusPtUploadSection
    extends HookViewModelWidget<InformasiPengurusPtViewModel> {
  const InformasiPengurusPtUploadSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusPtViewModel viewModel,
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
            onPressed: viewModel.fotoKtpPengurusPtPublicUrl == null
                ? viewModel.captureKtpPengurusPt
                : viewModel.clearKtpPengurusPt,
            errorText: viewModel.fotoKtpPengurusPtErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoNpwpDebiturPublicUrl,
            label: 'NPWP Pengurus',
            onPressed: viewModel.fotoNpwpDebitur == null
                ? viewModel.captureNpwpDebitur
                : viewModel.clearNpwp,
            errorText: viewModel.fotoNpwpDebiturErrorText,
          ),
        ],
      ),
    );
  }
}
