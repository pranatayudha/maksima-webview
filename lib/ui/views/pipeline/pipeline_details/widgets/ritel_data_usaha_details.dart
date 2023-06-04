import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_viewmodel_ritel.dart';
import 'ritel_label_and_value.dart';

class RitelDataUsahaDetails
    extends HookViewModelWidget<PipelineDetailsViewModelRitel> {
  const RitelDataUsahaDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsViewModelRitel viewModel,
  ) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const ThickLightGreyDivider(),
        _buildInfoUsahaSection(viewModel),
      ],
    );
  }

  Padding _buildInfoUsahaSection(PipelineDetailsViewModelRitel vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RitelLabelAndValue(
            'Nama Usaha',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.businessName!.isNotEmpty
                    ? vm.informasiUsaha!.businessName!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Sektor Ekonomi',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.economySectorsName!
                : '-',
          ),
          RitelLabelAndValue(
            'Sub Sektor Ekonomi',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.economySubSectorsName!
                : '-',
          ),
          RitelLabelAndValue(
            'Tag Location Alamat',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.tagLocation!.name!.isNotEmpty
                    ? vm.informasiUsaha!.tagLocation!.name!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Alamat Usaha',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.detail!.isNotEmpty
                    ? vm.informasiUsaha!.detail!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Kode Pos',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.postalCode!.isNotEmpty
                    ? vm.informasiUsaha!.postalCode!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Provinsi',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.province!.isNotEmpty
                    ? vm.informasiUsaha!.province!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Kota/Kabupaten',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.city!.isNotEmpty
                    ? vm.informasiUsaha!.city!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Kecamatan',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.district!.isNotEmpty
                    ? vm.informasiUsaha!.district!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Kelurahan',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.village!.isNotEmpty
                    ? vm.informasiUsaha!.village!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'RT',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.rt!.isNotEmpty
                    ? vm.informasiUsaha!.rt!
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'RW',
            vm.informasiUsaha != null
                ? vm.informasiUsaha!.rw!.isNotEmpty
                    ? vm.informasiUsaha!.rw!
                    : '-'
                : '-',
          ),
        ],
      ),
    );
  }
}
