import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/app/constants/common.dart';
import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../application/helpers/education_string_formatter.dart';
import '../../../../../application/helpers/religion_string_formatter.dart';
import '../../../../shared/ritel_foto_item.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_viewmodel_ritel.dart';
import 'ritel_label_and_value.dart';

class RitelDataDiriDetails
    extends HookViewModelWidget<PipelineDetailsViewModelRitel> {
  const RitelDataDiriDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsViewModelRitel viewModel,
  ) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            const ThickLightGreyDivider(),
            _buildInfoDataDiriSection(viewModel),
            const ThickLightGreyDivider(),
            _buildDokumenPeroranganSection(viewModel),
          ],
        ),
      ],
    );
  }

  // ignore: long-method
  Padding _buildInfoDataDiriSection(PipelineDetailsViewModelRitel vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RitelLabelAndValue(
            'Jenis Debitur',
            'Perorangan',
          ),
          RitelLabelAndValue(
            'Nama Lengkap Debitur Sesuai KTP',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.fullName!
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor KTP Debitur',
            vm.informasiDataDiri != null ? vm.informasiDataDiri!.ktpNum! : '-',
          ),
          RitelLabelAndValue(
            'Tanggal KTP Terbit',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.dateOfIssuedKTP != null
                    ? DateStringFormatter.forOutputRitel(
                        vm.informasiDataDiri!.dateOfIssuedKTP!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Agama',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.religion != null
                    ? ReligionStringFormatter.forOutput(
                        vm.informasiDataDiri!.religion!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Pendidikan Terakhir',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.lastEducation != null
                    ? EducationStringFormatter.forOutput(
                        vm.informasiDataDiri!.lastEducation!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor NPWP Debitur',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.npwpNum!.isNotEmpty
                    ? vm.informasiDataDiri!.npwpNum!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Tempat Lahir',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.placeOfBirth!
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal Lahir',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.dateOfBirth!.newDate!
                : '-',
          ),
          RitelLabelAndValue(
            'Jenis Kelamin',
            vm.informasiDataDiri != null ? vm.informasiDataDiri!.gender! : '-',
          ),
          RitelLabelAndValue(
            'Nama Gadis Ibu Kandung',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.motherMaiden!.isNotEmpty
                    ? vm.informasiDataDiri!.motherMaiden!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Status Perkawinan',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.maritalStatus!
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor KK',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.kkNum!.isNotEmpty
                    ? vm.informasiDataDiri!.kkNum!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Jumlah Tanggungan',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.numberOfDependents != null
                    ? vm.informasiDataDiri!.numberOfDependents.toString()
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Tag Location Alamat',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.tagLocation!.name!
                : '-',
          ),
          RitelLabelAndValue(
            'Detail Alamat',
            vm.informasiDataDiri != null ? vm.informasiDataDiri!.detail! : '-',
          ),
          RitelLabelAndValue(
            'Kode Pos',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.postalCode!
                : '-',
          ),
          RitelLabelAndValue(
            'Provinsi',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.province!
                : '-',
          ),
          RitelLabelAndValue(
            'Kota/Kabupaten',
            vm.informasiDataDiri != null ? vm.informasiDataDiri!.city! : '-',
          ),
          RitelLabelAndValue(
            'Kecamatan',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.district!
                : '-',
          ),
          RitelLabelAndValue(
            'Kelurahan',
            vm.informasiDataDiri != null ? vm.informasiDataDiri!.village! : '-',
          ),
          RitelLabelAndValue(
            'RT',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.rt!.isNotEmpty
                    ? vm.informasiDataDiri!.rt!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'RW',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.rw!.isNotEmpty
                    ? vm.informasiDataDiri!.rw!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor Handphone',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.phoneNum!
                : '-',
          ),
          RitelLabelAndValue(
            'Email',
            vm.informasiDataDiri != null
                ? vm.informasiDataDiri!.email!.isNotEmpty
                    ? vm.informasiDataDiri!.email!
                    : '-'
                : '-',
          ),
          if (vm.informasiDataDiri?.maritalStatus == Common.kawin)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RitelLabelAndValue(
                  'Nomor KTP Pasangan',
                  vm.informasiDataDiri != null
                      ? vm.informasiDataDiri!.spouseKtpNum!
                      : '-',
                ),
                RitelLabelAndValue(
                  'Nama Lengkap Pasangan',
                  vm.informasiDataDiri != null
                      ? vm.informasiDataDiri!.spouseFullname!
                      : '-',
                ),
                RitelLabelAndValue(
                  'Tempat Lahir Pasangan',
                  vm.informasiDataDiri != null
                      ? vm.informasiDataDiri!.spousePlaceOfBirth!
                      : '-',
                ),
                RitelLabelAndValue(
                  'Tanggal Lahir Pasangan',
                  vm.informasiDataDiri != null
                      ? vm.informasiDataDiri!.spouseDateOfBirth!.newDate!
                      : '-',
                ),
              ],
            ),
        ],
      ),
    );
  }

  Padding _buildDokumenPeroranganSection(PipelineDetailsViewModelRitel vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 0.h),
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
          RitelFotoItem('Foto E-KTP Debitur', vm.fotoKtpDebitur),
          RitelFotoItem('Foto Selfie Bersama E-KTP', vm.fotoKtpSelfie),
          RitelFotoItem('NPWP Debitur', vm.fotoNpwpDebitur),
          RitelFotoItem('Kartu Keluarga', vm.fotoKartuKeluargaDebitur),
          if (vm.informasiDataDiri?.maritalStatus == Common.kawin)
            Column(
              children: [
                RitelFotoItem('Foto E-KTP Pasangan', vm.fotoKtpPasangan),
                RitelFotoItem('Akta Nikah', vm.fotoAktaNikah),
              ],
            )
          else if (vm.informasiDataDiri?.maritalStatus == Common.ceraiHidup)
            RitelFotoItem('Akta Cerai', vm.fotoAktaCerai)
          else if (vm.informasiDataDiri?.maritalStatus == Common.ceraiMati)
            RitelFotoItem('Sertifikat Kematian', vm.suratKematian),
        ],
      ),
    );
  }
}
