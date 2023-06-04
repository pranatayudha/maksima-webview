import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../shared/upload_item_button_ritel.dart';
import '../informasi_pengurus_viewmodel.dart';

class CVUploadSection extends HookViewModelWidget<InformasiPengurusViewModel> {
  final String? prakarsaId;
  final String? pipelinesId;

  const CVUploadSection({
    Key? key,
    this.prakarsaId,
    this.pipelinesId,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    final informasiPengurus = viewModel.ritelInformasiPengurusCVForm![
        viewModel.informasiPengurusDataNavigatorIndex];

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
            // ignore: no-empty-block
            onPressed: () {},
            errorText: viewModel.fotoKtpPengurusCvErrorText,
            enabled: false,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoKtpSelfiePublicUrl,
            label: 'Foto Debitur Bersama E-KTP *',
            // ignore: no-empty-block
            onPressed: () {},
            errorText: viewModel.fotoKtpSelfieErrorText,
            enabled: false,
          ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoNpwpPengurusCVPublicUrl,
            label: 'NPWP Debitur *',
            onPressed: viewModel.captureNpwpPengurusCv,
            errorText: viewModel.fotoNpwpPengurusCVErrorText,
          ),
          if (informasiPengurus.maritalStatus == Common.kawin)
            UploadItemButtonRitel(
              imageUrl: viewModel.fotoKtpPasanganPublicUrl,
              label: 'Foto E-KTP Pasangan *',
              onPressed: viewModel.captureKtpPasangan,
              errorText: viewModel.fotoKtpPasanganErrorText,
              enabled: false,
            ),
          UploadItemButtonRitel(
            imageUrl: viewModel.fotoKartuKeluargaPublicUrl,
            label: 'Kartu Keluarga *',
            onPressed: viewModel.captureKartuKeluargaDebitur,
            errorText: viewModel.fotoKartuKeluargaErrorText,
          ),
          if (informasiPengurus.maritalStatus == Common.kawin)
            UploadItemButtonRitel(
              imageUrl: viewModel.fotoAktaNikahPublicUrl,
              label: 'Akta Nikah *',
              onPressed: viewModel.captureAktaNikah,
              errorText: viewModel.fotoAktaNikahErrorText,
            ),
          if (informasiPengurus.maritalStatus == Common.ceraiMati)
            UploadItemButtonRitel(
              imageUrl: viewModel.suratKematianPublicUrl,
              label: 'Sertifikat Kematian *',
              onPressed: viewModel.captureSuratKematian,
              errorText: viewModel.suratKematianErrorText,
            ),
          if (informasiPengurus.maritalStatus == Common.ceraiHidup)
            UploadItemButtonRitel(
              imageUrl: viewModel.fotoAktaCeraiPublicUrl,
              label: 'Akta Cerai *',
              onPressed: viewModel.captureAktaCerai,
              errorText: viewModel.fotoAktaCeraiErrorText,
            ),
        ],
      ),
    );
  }
}
