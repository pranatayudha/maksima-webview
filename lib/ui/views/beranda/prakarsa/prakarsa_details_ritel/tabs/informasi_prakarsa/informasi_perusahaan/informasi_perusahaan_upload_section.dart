import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../shared/upload_item_button_ritel.dart';
import 'informasi_perusahaan_viewmodel.dart';

class InformasiPrakarsaPerusahaanUploadSection
    extends HookViewModelWidget<InformasiPerusahaanViewModelRitel> {
  const InformasiPrakarsaPerusahaanUploadSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPerusahaanViewModelRitel viewModel,
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
            imageUrl: viewModel.fotoNpwpPerusahaanUrl,
            label: 'NPWP Perusahaan *',
            onPressed: viewModel.captureFotoNpwpPerusahaan,
            errorText: viewModel.fotoNpwpPerusahaanErrorText,
            enabled: false,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoAktaPendirianUrl,
            label: 'Akta Pendirian *',
            onPressed: viewModel.captureFotoAktaPendirian,
            errorText: viewModel.fotoAktaPendirianErrorText,
            enabled: false,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoAktaPerubahanTerakhirUrl,
            label: 'Akta Perubahan Terakhir *',
            onPressed: viewModel.captureFotoAktaPerubahanTerakhir,
            errorText: viewModel.fotoAktaPerubahanTerakhirErrorText,
            enabled: false,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoSkKumhamPendirianTerakhirUrl,
            label: 'SK Kumham Pendirian *',
            // onPressed: viewModel.captureFotoSkKumhamPendirianTerakhir,
            onPressed: () => viewModel.fotoSkKumhamPendirianTerakhirUrl == null
                ? viewModel.captureFotoSkKumhamPendirianTerakhir()
                : viewModel.clearSkKumhamPendirianTerakhir(),
            errorText: viewModel.fotoSkKumhamPendirianTerakhirErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoSkKumhamPerubahanTerakhirUrl,
            label: 'SK Kumham Perubahan Terakhir *',
            // onPressed: viewModel.captureFotoSkKumhamPerubahanTerakhir,
            onPressed: () => viewModel.fotoSkKumhamPerubahanTerakhirUrl == null
                ? viewModel.captureFotoSkKumhamPerubahanTerakhir()
                : viewModel.clearSkKumhamPerubahanTerakhir(),
            errorText: viewModel.fotoSkKumhamPendirianTerakhirErrorText,
          ),
          // if (viewModel.jenisDebiturController.text == 'Perusahaan - CV')
          //   Column(
          //     children: [
          //       UploadItemButton(
          //         imageFile: viewModel.suratNikahFile,
          //         label: 'Surat Nikah *',
          //         onPressed: viewModel.captureSuratNikah,
          //         errorText: viewModel.suratNikahErrorText,
          //       ),
          //       UploadItemButton(
          //         imageFile: viewModel.kkFile,
          //         label: 'Kartu Keluarga *',
          //         onPressed: viewModel.captureKK,
          //         errorText: viewModel.kkErrorText,
          //       ),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
