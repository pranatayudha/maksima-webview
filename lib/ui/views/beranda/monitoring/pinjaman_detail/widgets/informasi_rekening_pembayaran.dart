import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../shared/styles.dart';
import '../pinjaman_detail_viewmodel.dart';
import 'label_and_value.dart';

class InformasiRekeningPembayaran
    extends HookViewModelWidget<PinjamanDetailViewModel> {
  const InformasiRekeningPembayaran({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PinjamanDetailViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              'Rekening Pencairan',
              style: tsHeading8,
            ),
          ),
          LabelAndValue(
            'Nama Bank',
            viewModel.pinjamanDetail?.namaBankPencairan ?? '-',
          ),
          LabelAndValue(
            'No. Rekening',
            viewModel.pinjamanDetail?.numBankPencairan ?? '-',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              'Rekening Escrow Pembayaran',
              style: tsHeading8,
            ),
          ),
          LabelAndValue(
            'Nama Bank',
            viewModel.pinjamanDetail?.namaBankEscrow ?? '-',
          ),
          LabelAndValue(
            'No. Rekening',
            viewModel.pinjamanDetail?.numBankEscrow ?? '-',
          ),
        ],
      ),
    );
  }
}
