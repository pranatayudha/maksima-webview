import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../../../../application/app/constants/common.dart';
import '../../../../../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import '../../../../../../../pipeline/pipeline_details/widgets/ritel_item_perusahaan.dart';
import '../informasi_pengurus_viewmodel.dart';

class PrakarsaInformasiPengurusCVView
    extends HookViewModelWidget<InformasiPengurusViewModel> {
  const PrakarsaInformasiPengurusCVView({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        _buildInfoPengurusSection1(viewModel),
        const ThickLightGreyDivider(),
        _buildDokumenPengurusSection(context, viewModel),
      ],
    );
  }

  Padding _buildInfoPengurusSection1(InformasiPengurusViewModel viewModel) {
    final informasiPengurus = viewModel.ritelInformasiPengurusCV[
        viewModel.informasiPengurusDataNavigatorIndex];

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleAndSubtitle(
            'Nama Pengurus Sesuai KTP ',
            informasiPengurus.fullName ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Posisi Pengurus ',
            informasiPengurus.jobDescription ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Nomor KTP Pengurus',
            informasiPengurus.ktpNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Nomor NPWP',
            informasiPengurus.npwpNum ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Jenis Kelamin',
            informasiPengurus.gender ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tempat Lahir',
            informasiPengurus.placeOfBirth ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tanggal Lahir Pengurus',
            informasiPengurus.dateOfBirth != null
                ? DateStringFormatter.forOutputRitel(
                    informasiPengurus.dateOfBirth!,
                  )
                : '-',
          ),
          _buildTitleAndSubtitle(
            'Status Perkawinan',
            informasiPengurus.maritalStatus ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Tag Location Alamat Pengurus',
            informasiPengurus.tagLocation?.name ?? '-',
          ),
          _buildTitleAndSubtitle('Alamat KTP', informasiPengurus.detail ?? '-'),
          _buildTitleAndSubtitle(
            'Kode Pos',
            informasiPengurus.postalCode ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Provinsi',
            informasiPengurus.province ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kota',
            informasiPengurus.city ?? '-',
          ),
          _buildTitleAndSubtitle(
            'Kecamatan',
            informasiPengurus.district ?? '-',
          ),
          _buildTitleAndSubtitle('Kelurahan', informasiPengurus.village ?? '-'),
          _buildTitleAndSubtitle('RW', informasiPengurus.rw ?? '-'),
          _buildTitleAndSubtitle('RT', informasiPengurus.rt ?? '-'),
          _buildTitleAndSubtitle(
            'No. Handphone',
            informasiPengurus.phoneNum ?? '-',
          ),
          _buildTitleAndSubtitle('Email', informasiPengurus.email ?? '-'),
          if (informasiPengurus.maritalStatus == Common.kawin) ...[
            _buildTitleAndSubtitle(
              'Nomor KTP Pasangan',
              informasiPengurus.spouseKtpNum ?? '-',
            ),
            _buildTitleAndSubtitle(
              'Nama Lengkap Pasangan',
              informasiPengurus.spouseFullname ?? '-',
            ),
            _buildTitleAndSubtitle(
              'Tempat Lahir Pasangan',
              informasiPengurus.spousePlaceOfBirth ?? '-',
            ),
            _buildTitleAndSubtitle(
              'Tanggal Lahir Pasangan',
              informasiPengurus.spouseDateOfBirth != null
                  ? DateStringFormatter.forOutputRitel(
                      informasiPengurus.spouseDateOfBirth!,
                    )
                  : '-',
            ),
          ],
        ],
      ),
    );
  }

  Column _buildTitleAndSubtitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xff828896),
          ),
        ),
        const SizedBox(height: 1.0),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff162B3A),
          ),
        ),
      ],
    );
  }

  Container _buildDokumenPengurusSection(
    BuildContext context,
    InformasiPengurusViewModel viewModel,
  ) {
    final informasiPengurus = viewModel.ritelInformasiPengurusCV[
        viewModel.informasiPengurusDataNavigatorIndex];

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DOKUMEN',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff162B3A),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 18.h),
          RitelItemPerusahaan(
            'Foto e-KTP Pengurus',
            informasiPengurus.ktpPath ?? '',
          ),
          RitelItemPerusahaan(
            'Foto Debitur Bersama e-KTP',
            informasiPengurus.ktpSelfiePath ?? '',
          ),
          RitelItemPerusahaan(
            'NPWP Pengurus',
            informasiPengurus.npwpPath ?? '',
          ),
          if (informasiPengurus.maritalStatus == Common.kawin)
            RitelItemPerusahaan(
              'Foto e-KTP Pasangan',
              informasiPengurus.spouseKtpPath ?? '',
            ),
          RitelItemPerusahaan(
            'Kartu Keluarga',
            informasiPengurus.kkPath ?? '',
          ),
          if (informasiPengurus.maritalStatus == Common.kawin)
            RitelItemPerusahaan(
              'Akta Nikah',
              informasiPengurus.marriagePath ?? '',
            ),
          if (informasiPengurus.maritalStatus == Common.ceraiMati)
            RitelItemPerusahaan(
              'Sertifikat Kematian',
              informasiPengurus.deathCertificatePath ?? '',
            ),
          if (informasiPengurus.maritalStatus == Common.ceraiHidup)
            RitelItemPerusahaan(
              'Akta Cerai',
              informasiPengurus.divorcePath ?? '',
            ),
        ],
      ),
    );
  }
}
