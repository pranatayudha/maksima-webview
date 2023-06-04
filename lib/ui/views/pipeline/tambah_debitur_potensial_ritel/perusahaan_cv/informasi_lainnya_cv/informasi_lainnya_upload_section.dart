import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../shared/upload_item_button_ritel.dart';
import 'informasi_lainnya_viewmodel.dart';

class InformasiLainnyaUploadSection
    extends HookViewModelWidget<InformasiLainnyaCvViewModel> {
  const InformasiLainnyaUploadSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiLainnyaCvViewModel viewModel,
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
                ? viewModel.clearSKPI
                : viewModel.captureSKPI,
            errorText: viewModel.fotoSKPIErrorText,
            isLoading: viewModel.isLoadingSKPI,
          ),
        ],
      ),
    );
  }
}
