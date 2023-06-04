import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../shared/ritel_foto_item.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_perusahaan_cv_viewmodel_ritel.dart';
import 'ritel_label_and_value.dart';

class RitelInformasiPerusahaanCvDetails
    extends HookViewModelWidget<PipelineDetailsPerusahaanCvViewModelRitel> {
  const RitelInformasiPerusahaanCvDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsPerusahaanCvViewModelRitel viewModel,
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
            _buildDokumenPerusahaanCvSection(viewModel),
          ],
        ),
      ],
    );
  }

  // ignore: long-method
  Padding _buildInfoDataDiriSection(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RitelLabelAndValue(
            'Jenis Usaha',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.typePipeline!
                : '-',
          ),
          RitelLabelAndValue(
            'Nama Perusahaan',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.companyName!
                : '-',
          ),
          RitelLabelAndValue(
            'NPWP Perusahaan',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.companyNpwpNum!.isNotEmpty
                    ? vm.informasiPerusahaanCv!.companyNpwpNum!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Sektor Ekonomi',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.economySectorsName!
                : '-',
          ),
          RitelLabelAndValue(
            'Sub Sektor Ekonomi',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.economySubSectorsName!
                : '-',
          ),
          RitelLabelAndValue(
            'Tag Location Alamat Perusahaan',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.tagLocation!.name!.isNotEmpty
                    ? vm.informasiPerusahaanCv!.tagLocation!.name!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Alamat Usaha',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.detail!
                : '-',
          ),
          RitelLabelAndValue(
            'Kode Pos',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.postalCode!
                : '-',
          ),
          RitelLabelAndValue(
            'Provinsi',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.province!
                : '-',
          ),
          RitelLabelAndValue(
            'Kota/Kabupaten',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.city!
                : '-',
          ),

          RitelLabelAndValue(
            'Kecamatan',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.district!
                : '-',
          ),
          RitelLabelAndValue(
            'Kelurahan',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.village!
                : '-',
          ),
          RitelLabelAndValue(
            'RT',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.rt!.isNotEmpty
                    ? vm.informasiPerusahaanCv!.rt!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'RW',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.rw!.isNotEmpty
                    ? vm.informasiPerusahaanCv!.rw!
                    : '-'
                : '-',
          ),
          // //////////////////////////////////////////
          RitelLabelAndValue(
            'Tanggal Akta Pendirian',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.dateOfDeedEst != null
                    ? vm.informasiPerusahaanCv!.dateOfDeedEst!.newDate!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'No. Akta Pendiran',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.deedEstNum!.isNotEmpty
                    ? vm.informasiPerusahaanCv!.deedEstNum!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Tempat Akta Pendirian',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.placeOfDeedEst!
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal SK Kumham Pendirian',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.dateOfSkKumham != null
                    ? vm.informasiPerusahaanCv!.dateOfSkKumham!.newDate!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'No. SK Kumham Pendiran',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.skKumhamNum!.isNotEmpty
                    ? vm.informasiPerusahaanCv!.skKumhamNum!
                    : '-'
                : '-',
          ),
          ////////////////////////////////
          RitelLabelAndValue(
            'Tanggal Akta Perubahan Terakhir',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.latestDateOfDeed != null
                    ? vm.informasiPerusahaanCv!.latestDateOfDeed!.newDate!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'No. Akta Perubahan Terakhir',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.latestDeedNum!.isNotEmpty
                    ? vm.informasiPerusahaanCv!.latestDeedNum!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Tempat Akta Perubahan',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.latestPlaceOfDeed!
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal SK Kumham Perubahan Terakhir',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.latestDateOfSkKumham != null
                    ? vm.informasiPerusahaanCv!.latestDateOfSkKumham!.newDate!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'No. SK Kumham Perubahan Terakhir',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.latestSkKumhamNum!.isNotEmpty
                    ? vm.informasiPerusahaanCv!.latestSkKumhamNum!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Nama Lengkap PIC',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.fullnamePIC!
                : '-',
          ),

          RitelLabelAndValue(
            'Nomor Handphone',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.phoneNumPIC!
                : '-',
          ),
          RitelLabelAndValue(
            'Email',
            vm.informasiPerusahaanCv != null
                ? vm.informasiPerusahaanCv!.emailPIC!.isNotEmpty
                    ? vm.informasiPerusahaanCv!.emailPIC!
                    : '-'
                : '-',
          ),
        ],
      ),
    );
  }

  Padding _buildDokumenPerusahaanCvSection(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
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
          RitelFotoItem('NPWP Perusahaan', vm.fotoNpwpPerusahaanCv),
          RitelFotoItem('Akta Pendirian', vm.fotoAktaPendirian),
          RitelFotoItem(
            'Akta Perubahan Terakhir',
            vm.fotoAktaPerubahanTerakhir,
          ),
          RitelFotoItem(
            'SK Kumham Pendirian',
            vm.fotosKKumhamPendirian ?? '',
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
