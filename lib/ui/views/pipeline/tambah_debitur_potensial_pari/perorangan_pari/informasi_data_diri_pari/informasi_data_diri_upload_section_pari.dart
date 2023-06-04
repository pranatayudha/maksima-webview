import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/common.dart';
import '../../../../../shared/upload_item_button_ritel.dart';
import 'informasi_data_diri_viewmodel_pari.dart';

class InformasiDataDiriUploadSectionPari
    extends HookViewModelWidget<InformasiDataDiriViewModelPari> {
  const InformasiDataDiriUploadSectionPari({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiDataDiriViewModelPari viewModel,
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
            imageUrl: viewModel.fotoKtpDebiturPublicUrl,
            label: 'Foto E-KTP Debitur *',
            onPressed: viewModel.fotoKtpDebiturPublicUrl == null
                ? viewModel.captureKtpDebitur
                : viewModel.clearKtpDebitur,
            errorText: viewModel.fotoKtpDebiturErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoKtpSelfiePublicUrl,
            label: 'Foto Debitur Bersama E-KTP',
            onPressed: viewModel.fotoKtpSelfiePublicUrl == null
                ? viewModel.captureKtpSelfie
                : viewModel.clearKtpSelfie,
            errorText: viewModel.fotoKtpSelfieErrorText,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoNpwpDebiturPublicUrl,
            label: 'NPWP Debitur',
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
            errorText: viewModel.fotoKartuKeluargaDebiturErrorText,
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
