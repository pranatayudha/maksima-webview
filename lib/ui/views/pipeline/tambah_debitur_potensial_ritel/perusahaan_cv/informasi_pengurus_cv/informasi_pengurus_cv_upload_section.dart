import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/common.dart';
import '../../../../../shared/upload_item_button_ritel.dart';
import 'informasi_pengurus_cv_viewmodel.dart';

class InformasiPengurusCvUploadSection
    extends HookViewModelWidget<InformasiPengurusCvViewModel> {
  const InformasiPengurusCvUploadSection({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusCvViewModel viewModel,
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
            imageUrl: viewModel.fotoKtpPengurusCvPublicUrl,
            label: 'Foto E-KTP Pengurus *',
            onPressed: viewModel.fotoKtpPengurusCvPublicUrl == null
                ? viewModel.captureKtpPengurusCv
                : viewModel.clearKtpPengurusCv,
            errorText: viewModel.fotoKtpPengurusCvErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoKtpSelfiePublicUrl,
            label: 'Foto Selfie Bersama E-KTP *',
            onPressed: viewModel.fotoKtpSelfiePublicUrl == null
                ? viewModel.captureKtpSelfie
                : viewModel.clearKtpSelfie,
            errorText: viewModel.fotoKtpSelfieErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoNpwpDebiturPublicUrl,
            label: 'NPWP Pengurus',
            onPressed: viewModel.fotoNpwpDebiturPublicUrl == null
                ? viewModel.captureNpwpDebitur
                : viewModel.clearNpwp,
            errorText: viewModel.fotoNpwpDebiturErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoKartuKeluargaPublicUrl,
            label: 'Kartu Keluarga',
            onPressed: viewModel.fotoKartuKeluargaPublicUrl == null
                ? viewModel.captureKartuKeluargaDebitur
                : viewModel.clearKK,
            errorText: viewModel.fotoKartuKeluargaErrorText,
          ),
          if (viewModel.statusPerkawinanController.text == Common.kawin)
            Column(
              children: [
                UploadItemButtonRitel(
                  imageUrl: viewModel.fotoKtpPasanganPublicUrl,
                  label: 'Foto E-KTP Pasangan *',
                  onPressed: viewModel.fotoKtpPasanganPublicUrl == null
                      ? viewModel.captureKtpPasangan
                      : viewModel.clearKtpPasangan,
                  errorText: viewModel.fotoKtpPasanganErrorText,
                ),
                UploadItemButtonRitel(
                  imageUrl: viewModel.fotoAktaNikahPublicUrl,
                  label: 'Akta Nikah',
                  onPressed: viewModel.fotoAktaNikahPublicUrl == null
                      ? viewModel.captureAktaNikah
                      : viewModel.clearAktaNikah,
                  errorText: viewModel.fotoAktaNikahErrorText,
                ),
              ],
            ),
          if (viewModel.statusPerkawinanController.text == Common.ceraiHidup)
            Column(
              children: [
                UploadItemButtonRitel(
                  imageUrl: viewModel.fotoAktaCeraiPublicUrl,
                  label: 'Akta Cerai',
                  onPressed: viewModel.fotoAktaCeraiPublicUrl == null
                      ? viewModel.captureAktaCerai
                      : viewModel.clearAktaCerai,
                  errorText: viewModel.fotoAktaCeraiErrorText,
                ),
              ],
            ),
          if (viewModel.statusPerkawinanController.text == Common.ceraiMati)
            Column(
              children: [
                UploadItemButtonRitel(
                  imageUrl: viewModel.suratKematianPublicUrl,
                  label: 'Sertifikat Kematian',
                  onPressed: viewModel.suratKematianPublicUrl == null
                      ? viewModel.captureSuratKematian
                      : viewModel.clearSuratKematian,
                  errorText: viewModel.suratKematianErrorText,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
