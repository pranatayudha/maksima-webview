import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../pipeline/pipeline_details/widgets/ritel_item_perusahaan.dart';
import '../../informasi_pinjaman_viewmodel_ritel.dart';

class InformasiPinjamanDocSection
    extends HookViewModelWidget<InformasiPinjamanViewModel> {
  const InformasiPinjamanDocSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPinjamanViewModel viewModel,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.w, 16.h, 0.w, 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'DOKUMEN',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10.h),
          RitelItemPerusahaan(
            'Surat Permohonan Kredit Debitur',
            viewModel.ritelInformasiPinjaman.suratPermohonanPath!,
          ),
        ],
      ),
    );
  }
}
