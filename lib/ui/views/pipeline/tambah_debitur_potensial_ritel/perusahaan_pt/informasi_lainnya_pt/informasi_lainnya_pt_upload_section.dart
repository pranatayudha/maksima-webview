import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../shared/upload_item_button_ritel.dart';
import 'informasi_lainnya_pt_viewmodel.dart';

class InformasiLainnyaPtUploadSection
    extends HookViewModelWidget<InformasiLainnyaPtViewModel> {
  const InformasiLainnyaPtUploadSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiLainnyaPtViewModel viewModel,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 21),
          Text(
            'UPLOAD FILE',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 16.h),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoSKPIPublicUrl,
            label: 'Surat Permohonan Kredit Debitur *',
            onPressed: viewModel.fotoSKPIPublicUrl != null
                ? viewModel.clearFotoSKPI
                : viewModel.capturefotoSKPI,
            errorText: viewModel.fotoSKPIErrorText,
            isLoading: viewModel.isLoadingSKPI,
          ),
        ],
      ),
    );
  }
}
