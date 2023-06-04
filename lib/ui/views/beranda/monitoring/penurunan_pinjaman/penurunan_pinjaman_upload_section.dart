import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../shared/upload_item_button_ritel.dart';
import 'penurunan_pinjaman_viewmodel.dart';

class PenurunanPinjamanUploadSection
    extends HookViewModelWidget<PenurunanPinjamanViewModel> {
  const PenurunanPinjamanUploadSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PenurunanPinjamanViewModel viewModel,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 16.h),
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
            imageUrl: viewModel.lampiranPermohonanPublicUrl,
            label: 'Lampiran Permohonan Penurunan *',
            onPressed: viewModel.lampiranPermohonanPublicUrl == null
                ? viewModel.captureLampiranPermohonan
                : viewModel.clearLampiranPermohonan,
            errorText: viewModel.lampiranPermohonanErrorText,
          ),
        ],
      ),
    );
  }
}
