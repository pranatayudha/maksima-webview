import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../shared/ritel_foto_item.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_perusahaan_pt_viewmodel_ritel.dart';
import 'ritel_label_and_value.dart';

class RitelInformasiPerusahaanPtDetails
    extends HookViewModelWidget<PipelineDetailsPerusahaanPtViewModelRitel> {
  const RitelInformasiPerusahaanPtDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsPerusahaanPtViewModelRitel viewModel,
  ) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            const ThickLightGreyDivider(),
            _buildInformasiPerusahaanPtSection(viewModel),
            const ThickLightGreyDivider(),
            _buildDokumenPeroranganSection(viewModel),
          ],
        ),
      ],
    );
  }

  // ignore: long-method
  Padding _buildInformasiPerusahaanPtSection(
    PipelineDetailsPerusahaanPtViewModelRitel vm,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RitelLabelAndValue(
            'Jenis Usaha',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.typePipeline!
                : '-',
          ),
          RitelLabelAndValue(
            'Nama Perusahaan',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.companyName!
                : '-',
          ),
          RitelLabelAndValue(
            'NPWP Perusahaan',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.companyNpwpNum!
                : '-',
          ),
          RitelLabelAndValue(
            'Sektor Ekonomi',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.economySectorsName!
                : '-',
          ),
          RitelLabelAndValue(
            'Sub Sektor Ekonomi',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.economySubSectorsName!
                : '-',
          ),
          RitelLabelAndValue(
            'Tag Location Alamat Perusahaan',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.tagLocation!.name!.isNotEmpty
                    ? vm.informasiPerusahaanPt!.tagLocation!.name!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Alamat Usaha',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.detail!
                : '-',
          ),
          RitelLabelAndValue(
            'Kode Pos',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.postalCode!
                : '-',
          ),
          RitelLabelAndValue(
            'Provinsi',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.province!
                : '-',
          ),
          RitelLabelAndValue(
            'Kota',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.city!
                : '-',
          ),
          RitelLabelAndValue(
            'Kecamatan',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.district!
                : '-',
          ),
          RitelLabelAndValue(
            'Kelurahan',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.village!
                : '-',
          ),
          RitelLabelAndValue(
            'RT',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.rt!
                : '-',
          ),
          RitelLabelAndValue(
            'RW',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.rw!
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal Akta Pendirian',
            vm.informasiPerusahaanPt != null
                // ignore: unnecessary_null_comparison
                ? vm.informasiPerusahaanPt!.dateOfDeedEst! != null
                    ? DateStringFormatter.forOutputRitel(
                        vm.informasiPerusahaanPt!.dateOfDeedEst!.date!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'No. Akta Pendiran',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.deedEstNum!.isNotEmpty
                    ? vm.informasiPerusahaanPt!.deedEstNum!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Tempat Akta Pendirian',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.placeOfDeedEst!
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal SK Kumham Pendirian',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.dateOfSkKumham != null
                    ? DateStringFormatter.forOutputRitel(
                        vm.informasiPerusahaanPt!.dateOfSkKumham!.date!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'No. SK Kumham Pendiran',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.skKumhamNum!.isNotEmpty
                    ? vm.informasiPerusahaanPt!.skKumhamNum!
                    : '-'
                : '-',
          ),
          ////////////////////////////////
          RitelLabelAndValue(
            'Tanggal Akta Perubahan Terakhir',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.latestDateOfDeed != null
                    ? DateStringFormatter.forOutputRitel(
                        vm.informasiPerusahaanPt!.latestDateOfDeed!.date!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'No. Akta Perubahan Terakhir',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.latestDeedNum!.isNotEmpty
                    ? vm.informasiPerusahaanPt!.latestDeedNum!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Tempat Akta Perubahan Terakhir',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.latestPlaceOfDeed!
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal SK Kumham Perubahan Terakhir',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.latestDateOfSkKumham != null
                    ? DateStringFormatter.forOutputRitel(
                        vm.informasiPerusahaanPt!.latestDateOfSkKumham!.date!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'No. SK Kumham Penfirian Terakhir',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.latestSkKumhamNum!.isNotEmpty
                    ? vm.informasiPerusahaanPt!.latestSkKumhamNum!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Nama Lengkap PIC',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.fullnamePIC!
                : '-',
          ),

          RitelLabelAndValue(
            'Nomor Handphone',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.phoneNumPIC!
                : '-',
          ),
          RitelLabelAndValue(
            'Email',
            vm.informasiPerusahaanPt != null
                ? vm.informasiPerusahaanPt!.emailPIC!.isNotEmpty
                    ? vm.informasiPerusahaanPt!.emailPIC!
                    : '-'
                : '-',
          ),
        ],
      ),
    );
  }

  Padding _buildDokumenPeroranganSection(
    PipelineDetailsPerusahaanPtViewModelRitel vm,
  ) {
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
          RitelFotoItem('NPWP Perusahaan', vm.fotoNpwpPerusahaanPt),
          RitelFotoItem('Akta Pendirian', vm.fotoAktaPendirian ?? ''),
          RitelFotoItem(
            'Akta Perubahaan Terakhir',
            vm.fotoAktaPerubahanTerakhir ?? '',
          ),
          RitelFotoItem(
            'SK Kumham Pendirian',
            vm.fotosKumhamPendirian ?? '',
          ),
          RitelFotoItem(
            'SK Kumham Perubahan Terakhir',
            vm.fotosKkumhamPerubahaanTerakhir ?? '',
          ),
        ],
      ),
    );
  }
}
