import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/app/constants/common.dart';
import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../application/helpers/job_code_formatter.dart';
import '../../../../shared/ritel_foto_item.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_perusahaan_cv_viewmodel_ritel.dart';
import 'data_navigator.dart';
import 'ritel_label_and_value.dart';

class RitelInformasiPengurusCvDetails
    extends HookViewModelWidget<PipelineDetailsPerusahaanCvViewModelRitel> {
  final String pipelineId;
  final int? statusPipeline;
  final int codeTable;

  const RitelInformasiPengurusCvDetails({
    Key? key,
    required this.pipelineId,
    this.statusPipeline,
    required this.codeTable,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsPerusahaanCvViewModelRitel viewModel,
  ) {
    return Stack(
      children: [
        if (viewModel.informasiPengurusCv != null)
          ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ThickLightGreyDivider(),
                  DataNavigator(
                    prefix: 'Pengurus',
                    index: viewModel.informasiPengurusDataNavigatorIndex,
                    onChanged:
                        viewModel.changeInformasiPengurusDataNavigatorIndex,
                    length: viewModel.informasiPengurusCv!.length,
                  ),
                  _buildInfoPengurusSection(viewModel),
                  const ThickLightGreyDivider(),
                  _buildDokumenPengurusSection(viewModel),
                ],
              );
            },
          )
        else
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              const ThickLightGreyDivider(),
              _buildInfoPengurusCvSectionWithoutData(),
              const ThickLightGreyDivider(),
              _buildDokumenPengurusSectionWithoutData(),
            ],
          ),
      ],
    );
  }

  // ignore: long-method
  Padding _buildInfoPengurusSection(
    PipelineDetailsPerusahaanCvViewModelRitel viewModel,
  ) {
    final informasiPengurusCV = viewModel
        .informasiPengurusCv![viewModel.informasiPengurusDataNavigatorIndex];

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18.h),
          RitelLabelAndValue(
            'Nama Pengurus Sesuai KTP',
            informasiPengurusCV.fullName != null
                ? informasiPengurusCV.fullName!
                : '-',
          ),
          RitelLabelAndValue(
            'Posisi Pengurus',
            informasiPengurusCV.jobCode != null
                ? JobCodeFormatter.forOutput(informasiPengurusCV.jobCode!)
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor KTP Pengurus',
            informasiPengurusCV.ktpNum != null
                ? informasiPengurusCV.ktpNum!
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor NPWP',
            informasiPengurusCV.npwpNum != null
                ? informasiPengurusCV.npwpNum!
                : '-',
          ),
          RitelLabelAndValue(
            'Jenis Kelamin',
            informasiPengurusCV.gender != null
                ? informasiPengurusCV.gender!
                : '-',
          ),
          RitelLabelAndValue(
            'Tempat Lahir',
            informasiPengurusCV.placeOfBirth != null
                ? informasiPengurusCV.placeOfBirth!
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal Lahir Pengurus',
            informasiPengurusCV.dateOfBirth != null
                ? informasiPengurusCV.dateOfBirth != null
                    ? DateStringFormatter.forOutputRitel(
                        informasiPengurusCV.dateOfBirth!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Status Perkawinan',
            informasiPengurusCV.maritalStatus != null
                ? informasiPengurusCV.maritalStatus!
                : '-',
          ),
          RitelLabelAndValue(
            'Tag Location Alamat Pengurus',
            informasiPengurusCV.tagLocation != null
                ? informasiPengurusCV.tagLocation!.name!.isNotEmpty
                    ? informasiPengurusCV.tagLocation!.name!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Alamat KTP',
            informasiPengurusCV.detail != null
                ? informasiPengurusCV.detail!
                : '-',
          ),
          RitelLabelAndValue(
            'Kode Pos',
            informasiPengurusCV.postalCode != null
                ? informasiPengurusCV.postalCode!
                : '-',
          ),
          RitelLabelAndValue(
            'Provinsi',
            informasiPengurusCV.province != null
                ? informasiPengurusCV.province!
                : '-',
          ),
          RitelLabelAndValue(
            'Kota/Kabupaten',
            informasiPengurusCV.city != null ? informasiPengurusCV.city! : '-',
          ),
          RitelLabelAndValue(
            'Kecamatan',
            informasiPengurusCV.district != null
                ? informasiPengurusCV.district!
                : '-',
          ),
          RitelLabelAndValue(
            'Kelurahan',
            informasiPengurusCV.village != null
                ? informasiPengurusCV.village!
                : '-',
          ),
          RitelLabelAndValue(
            'RT',
            informasiPengurusCV.rt != null
                ? informasiPengurusCV.rt!.isNotEmpty
                    ? informasiPengurusCV.rt!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'RW',
            informasiPengurusCV.rw != null
                ? informasiPengurusCV.rw!.isNotEmpty
                    ? informasiPengurusCV.rw!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor Handphone',
            informasiPengurusCV.phoneNum != null
                ? informasiPengurusCV.phoneNum!
                : '-',
          ),
          RitelLabelAndValue(
            'Email',
            informasiPengurusCV.email != null
                ? informasiPengurusCV.email!.isNotEmpty
                    ? informasiPengurusCV.email!
                    : '-'
                : '-',
          ),
          if (informasiPengurusCV.maritalStatus == Common.kawin)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RitelLabelAndValue(
                  'Nomor KTP Pasangan',
                  informasiPengurusCV.spouseKtpNum != null
                      ? informasiPengurusCV.spouseKtpNum != null
                          ? informasiPengurusCV.spouseKtpNum!
                          : '-'
                      : '-',
                ),
                RitelLabelAndValue(
                  'Nama Lengkap Pasangan',
                  informasiPengurusCV.spouseFullname != null
                      ? informasiPengurusCV.spouseFullname!
                      : '-',
                ),
                RitelLabelAndValue(
                  'Tempat Lahir Pasangan',
                  informasiPengurusCV.spousePlaceOfBirth != null
                      ? informasiPengurusCV.spousePlaceOfBirth!
                      : '-',
                ),
                RitelLabelAndValue(
                  'Tanggal Lahir Pasangan',
                  informasiPengurusCV.spouseDateOfBirth != null
                      ? informasiPengurusCV.spouseDateOfBirth != null
                          ? DateStringFormatter.forOutputRitel(
                              informasiPengurusCV.spouseDateOfBirth!,
                            )
                          : '-'
                      : '-',
                ),
              ],
            ),
        ],
      ),
    );
  }

  // ignore: long-method
  Widget _buildDokumenPengurusSection(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
  ) {
    final informasiPengurusCV =
        vm.informasiPengurusCv![vm.informasiPengurusDataNavigatorIndex];

    if (vm.ktpPath == null ||
        vm.ktpSelfiePath == null ||
        vm.npwpPath == null ||
        vm.kkPath == null) {
      return const LinearProgressIndicator();
    } else if (informasiPengurusCV.maritalStatus == Common.kawin &&
            vm.spouseKtpPath == null ||
        vm.marriagePath == null) {
      return const LinearProgressIndicator();
    } else if (informasiPengurusCV.maritalStatus == Common.ceraiHidup &&
        vm.divorcePath == null) {
      return const LinearProgressIndicator();
    } else if (informasiPengurusCV.maritalStatus == Common.ceraiMati &&
        vm.deathCertificatePath == null) {
      return const LinearProgressIndicator();
    } else {
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
            RitelFotoItem(
              'Foto E-KTP Pengurus',
              vm.ktpPath != '' ? vm.ktpPath! : null,
            ),
            RitelFotoItem(
              'Foto Pengurus Bersama E-KTP',
              vm.ktpSelfiePath != '' ? vm.ktpSelfiePath! : null,
            ),
            RitelFotoItem(
              'NPWP Pengurus',
              vm.npwpPath != '' ? vm.npwpPath! : null,
            ),
            RitelFotoItem(
              'Kartu Keluarga',
              vm.kkPath != '' ? vm.kkPath! : null,
            ),
            if (informasiPengurusCV.maritalStatus == Common.kawin)
              Column(
                children: [
                  RitelFotoItem(
                    'Foto E-KTP Pasangan',
                    vm.spouseKtpPath != '' ? vm.spouseKtpPath! : null,
                  ),
                  RitelFotoItem(
                    'Akta Nikah',
                    vm.marriagePath != '' ? vm.marriagePath! : null,
                  ),
                ],
              )
            else if (informasiPengurusCV.maritalStatus == Common.ceraiHidup)
              Column(
                children: [
                  RitelFotoItem(
                    'Akta Cerai',
                    vm.divorcePath != '' ? vm.divorcePath! : null,
                  ),
                ],
              )
            else if (informasiPengurusCV.maritalStatus == Common.ceraiMati)
              RitelFotoItem(
                'Sertifikat Kematian',
                vm.deathCertificatePath != '' ? vm.deathCertificatePath! : null,
              ),
          ],
        ),
      );
    }
  }

  Padding _buildInfoPengurusCvSectionWithoutData() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          const Text(
            'PENGURUS -',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff162B3A),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 18.h),
          const RitelLabelAndValue(
            'Nama Pengurus Sesuai KTP',
            '-',
          ),
          const RitelLabelAndValue(
            'Posisi Pengurus',
            '-',
          ),
          const RitelLabelAndValue(
            'Nomor KTP Pengurus',
            '-',
          ),
          const RitelLabelAndValue(
            'Nomor NPWP',
            '-',
          ),
          const RitelLabelAndValue(
            'Jenis Kelamin',
            '-',
          ),
          const RitelLabelAndValue(
            'Tempat Lahir',
            '-',
          ),
          const RitelLabelAndValue(
            'Tanggal Lahir Pengurus',
            '-',
          ),
          const RitelLabelAndValue(
            'Status Perkawinan',
            '-',
          ),
          const RitelLabelAndValue(
            'Tag Location Alamat Perusahaan',
            '-',
          ),
          const RitelLabelAndValue(
            'Alamat KTP',
            '-',
          ),
          const RitelLabelAndValue(
            'Kode Pos',
            '-',
          ),
          const RitelLabelAndValue(
            'Provinsi',
            '-',
          ),
          const RitelLabelAndValue(
            'Kota/Kabupaten',
            '-',
          ),
          const RitelLabelAndValue(
            'Kecamatan',
            '-',
          ),
          const RitelLabelAndValue(
            'Kelurahan',
            '-',
          ),
          const RitelLabelAndValue(
            'RT',
            '-',
          ),
          const RitelLabelAndValue(
            'RW',
            '-',
          ),
          const RitelLabelAndValue(
            'Nomor Handphone',
            '-',
          ),
          const RitelLabelAndValue(
            'Email',
            '-',
          ),
        ],
      ),
    );
  }

  Padding _buildDokumenPengurusSectionWithoutData() {
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
          const RitelFotoItem('Foto E-KTP Pengurus', null),
          const RitelFotoItem('Foto Selfie Bersama E-KTP ', null),
          const RitelFotoItem('NPWP Pengurus', null),
        ],
      ),
    );
  }
}
