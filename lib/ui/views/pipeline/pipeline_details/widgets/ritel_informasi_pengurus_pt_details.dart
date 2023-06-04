// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../../application/helpers/job_code_formatter.dart';
import '../../../../../application/models/ritel_informasi_pengurus_pt.dart';
import '../../../../shared/ritel_foto_item.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_perusahaan_pt_viewmodel_ritel.dart';
import 'ritel_label_and_value.dart';

class RitelInformasiPengurusPtDetails
    extends HookViewModelWidget<PipelineDetailsPerusahaanPtViewModelRitel> {
  final String pipelineId;
  final int? statusPipeline;

  const RitelInformasiPengurusPtDetails({
    Key? key,
    required this.pipelineId,
    this.statusPipeline,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsPerusahaanPtViewModelRitel viewModel,
  ) {
    return Stack(
      children: [
        if (viewModel.informasiPengurusPT!.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: viewModel.informasiPengurusPT!.length,
            itemBuilder: (context, index) {
              final informasiPengurusPT = viewModel.informasiPengurusPT![index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ThickLightGreyDivider(),
                  _buildInfoPengurusPtSection(index + 1, informasiPengurusPT),
                  const ThickLightGreyDivider(),
                  _buildDokumenPengurusSection(viewModel, informasiPengurusPT),
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
              _buildInfoPengurusPtSectionWithoutData(),
              const ThickLightGreyDivider(),
              _buildDokumenPengurusSectionWithoutData(),
            ],
          ),
      ],
    );
  }

  // ignore: long-method
  Padding _buildInfoPengurusPtSection(
    int index,
    RitelInformasiPengurusPT informasiPengurusPT,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          Text(
            'PENGURUS $index',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff162B3A),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 18.h),
          RitelLabelAndValue(
            'Nama Pengurus Sesuai KTP',
            informasiPengurusPT.fullName != null
                ? informasiPengurusPT.fullName!
                : '-',
          ),
          RitelLabelAndValue(
            'Posisi Pengurus',
            informasiPengurusPT != null
                ? informasiPengurusPT.jobCode != null
                    ? JobCodeFormatter.forOutput(informasiPengurusPT.jobCode!)
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor KTP Pengurus',
            informasiPengurusPT.ktpNum != null
                ? informasiPengurusPT.ktpNum!
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor NPWP',
            informasiPengurusPT.npwpNum != null
                ? informasiPengurusPT.npwpNum!
                : '-',
          ),
          RitelLabelAndValue(
            'Jenis Kelamin',
            informasiPengurusPT.gender != null
                ? informasiPengurusPT.gender!
                : '-',
          ),
          RitelLabelAndValue(
            'Tempat Lahir',
            informasiPengurusPT.placeOfBirth != null
                ? informasiPengurusPT.placeOfBirth!
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal Lahir',
            informasiPengurusPT.dateOfBirth != null
                ? informasiPengurusPT.dateOfBirth != null
                    ? DateStringFormatter.forOutputRitel(
                        informasiPengurusPT.dateOfBirth!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Nomor Handphone',
            informasiPengurusPT.phoneNum != null
                ? informasiPengurusPT.phoneNum!
                : '-',
          ),
          RitelLabelAndValue(
            'Email',
            informasiPengurusPT.email != null
                ? informasiPengurusPT.email!.isNotEmpty
                    ? informasiPengurusPT.email!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Tag Location Alamat Pengurus',
            informasiPengurusPT.tagLocation != null
                ? informasiPengurusPT.tagLocation!.name!.isNotEmpty
                    ? informasiPengurusPT.tagLocation!.name!
                    : '-'
                : '-',
          ),

          RitelLabelAndValue(
            'Alamat KTP',
            informasiPengurusPT.detail != null
                ? informasiPengurusPT.detail!
                : '-',
          ),
          RitelLabelAndValue(
            'Kode Pos',
            informasiPengurusPT.postalCode != null
                ? informasiPengurusPT.postalCode!
                : '-',
          ),

          RitelLabelAndValue(
            'Provinsi',
            informasiPengurusPT.province != null
                ? informasiPengurusPT.province!
                : '-',
          ),
          RitelLabelAndValue(
            'Kota/Kabupaten',
            informasiPengurusPT.city != null ? informasiPengurusPT.city! : '-',
          ),

          RitelLabelAndValue(
            'Kecamatan',
            informasiPengurusPT.district != null
                ? informasiPengurusPT.district!
                : '-',
          ),
          RitelLabelAndValue(
            'Kelurahan',
            informasiPengurusPT.village != null
                ? informasiPengurusPT.village!
                : '-',
          ),
          RitelLabelAndValue(
            'RT',
            informasiPengurusPT.rt != null
                ? informasiPengurusPT.rt!.isNotEmpty
                    ? informasiPengurusPT.rt!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'RW',
            informasiPengurusPT.rw != null
                ? informasiPengurusPT.rw!.isNotEmpty
                    ? informasiPengurusPT.rw!
                    : '-'
                : '-',
          ),
          // //////////////////////////////////////////

          RitelLabelAndValue(
            'Persentase Saham',
            informasiPengurusPT.sharePercentage != null
                ? informasiPengurusPT.sharePercentage!.toString()
                : '-',
          ),
          RitelLabelAndValue(
            'Jumlah Lembar',
            informasiPengurusPT.shares != null
                ? informasiPengurusPT.shares!.toString()
                : '-',
          ),
          RitelLabelAndValue(
            'Nominal',
            informasiPengurusPT.shareNominal != null
                ? informasiPengurusPT.shareNominal!.toString()
                : '-',
          ),
        ],
      ),
    );
  }

  Widget _buildDokumenPengurusSection(
    PipelineDetailsPerusahaanPtViewModelRitel vm,
    RitelInformasiPengurusPT ritelInformasiPengurusPT,
  ) {
    return ViewModelBuilder<PipelineDetailsPerusahaanPtViewModelRitel>.reactive(
      viewModelBuilder: () => PipelineDetailsPerusahaanPtViewModelRitel(
        pipelineId: pipelineId,
        statusPipeline: statusPipeline,
      ),
      onModelReady: (viewModel) async {
        await viewModel.getPublicFileKTP(ritelInformasiPengurusPT.ktpPath!);
        await viewModel.getPublicFileNPWP(ritelInformasiPengurusPT.npwpPath!);
      },
      builder: (ctx, viewModel2, child) {
        // ignore: prefer-conditional-expressions
        if (viewModel2.ktpPath == null || viewModel2.npwpPath == null) {
          return LinearProgressIndicator();
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
                  viewModel2.ktpPath != '' ? viewModel2.ktpPath! : null,
                ),
                RitelFotoItem(
                  'NPWP Pengurus',
                  viewModel2.npwpPath != '' ? viewModel2.npwpPath! : null,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Padding _buildInfoPengurusPtSectionWithoutData() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          Text(
            'PENGURUS -',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff162B3A),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 18.h),
          RitelLabelAndValue(
            'Nama Pengurus Sesuai KTP',
            '-',
          ),
          RitelLabelAndValue(
            'Posisi Pengurus',
            '-',
          ),
          RitelLabelAndValue(
            'Nomor KTP Pengurus',
            '-',
          ),
          RitelLabelAndValue(
            'Nomor NPWP',
            '-',
          ),
          RitelLabelAndValue(
            'Jenis Kelamin',
            '-',
          ),
          RitelLabelAndValue(
            'Tempat Lahir',
            '-',
          ),
          RitelLabelAndValue(
            'Tanggal Lahir',
            '-',
          ),
          RitelLabelAndValue(
            'Nomor Handphone',
            '-',
          ),
          RitelLabelAndValue(
            'Email',
            '-',
          ),
          RitelLabelAndValue(
            'Tag Location Alamat Pengurus',
            '-',
          ),

          RitelLabelAndValue(
            'Alamat KTP',
            '-',
          ),
          RitelLabelAndValue(
            'Kode Pos',
            '-',
          ),

          RitelLabelAndValue(
            'Provinsi',
            '-',
          ),
          RitelLabelAndValue(
            'Kota/Kabupaten',
            '-',
          ),

          RitelLabelAndValue(
            'Kecamatan',
            '-',
          ),
          RitelLabelAndValue(
            'Kelurahan',
            '-',
          ),
          RitelLabelAndValue(
            'RT',
            '-',
          ),
          RitelLabelAndValue(
            'RW',
            '-',
          ),
          // //////////////////////////////////////////

          RitelLabelAndValue(
            'Persentase Saham',
            '-',
          ),
          RitelLabelAndValue(
            'Jumlah Lembar',
            '-',
          ),
          RitelLabelAndValue(
            'Nominal',
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
          RitelFotoItem('Foto E-KTP Pengurus', null),
          RitelFotoItem('NPWP Pengurus', null),
        ],
      ),
    );
  }
}
