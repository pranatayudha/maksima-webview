import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../shared/upload_item_button_ritel.dart';
import 'informasi_perusahaan_pt_viewmodel.dart';

class InformasiPerusahaanPtUploadSection
    extends HookViewModelWidget<InformasiPerusahaanPtViewModel> {
  const InformasiPerusahaanPtUploadSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPerusahaanPtViewModel viewModel,
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
            imageUrl: viewModel.fotoNpwpPerusahaanPtPublicUrl,
            label: 'NPWP Perusahaan *',
            onPressed: viewModel.fotoNpwpPerusahaanPtPublicUrl == null
                ? viewModel.captureNpwpPerusahaanPt
                : viewModel.clearNpwpPerusahaanPt,
            errorText: viewModel.fotoNpwpPerusahaanPtErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoAktaPendirianPublicUrl,
            label: 'Akta Pendirian *',
            onPressed: viewModel.fotoAktaPendirianPublicUrl == null
                ? viewModel.captureAktaPendirian
                : viewModel.clearAktaPendirian,
            errorText: viewModel.fotoAktaPendirianErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoAktaPerubahaanTerakhirPublicUrl,
            label: 'Akta Perubahaan Terakhir *',
            onPressed: viewModel.fotoAktaPerubahaanTerakhirPublicUrl == null
                ? viewModel.captureAktaPerubahaanTerakhir
                : viewModel.clearAktaPerubahaanTerakhir,
            errorText: viewModel.fotoAktaPerubahaanTerakhirErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotosKkumhamPendirianPublicUrl,
            label: 'SK Kumham Pendirian',
            onPressed: viewModel.fotosKkumhamPendirianPublicUrl == null
                ? viewModel.captureSKkumhamPendirian
                : viewModel.clearSkKumhamPendirian,
            errorText: viewModel.fotosKkumhamPendirianErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotosKkumhamPerubahaanTerakhirPublicUrl,
            label: 'SK Kumham Perubahaan Terakhir',
            onPressed: viewModel.fotosKkumhamPerubahaanTerakhirPublicUrl == null
                ? viewModel.capturesKkumhamPerubahaanTerakhir
                : viewModel.clearsKkumhamPerubahaanTerakhir,
            errorText: viewModel.fotosKkumhamPerubahaanTerakhirErrorText,
          ),
        ],
      ),
    );
  }
}
