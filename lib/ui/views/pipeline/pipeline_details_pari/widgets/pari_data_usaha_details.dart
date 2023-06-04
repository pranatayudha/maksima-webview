import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_viewmodel_pari.dart';
import 'pari_label_and_value.dart';

class PariDataUsahaDetails
    extends HookViewModelWidget<PipelineDetailsViewModelPari> {
  const PariDataUsahaDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsViewModelPari viewModel,
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

  Padding _buildInfoUsahaSection(PipelineDetailsViewModelPari vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PariLabelAndValue(
            'Nama Usaha',
            vm.setStringResponse(
              vm.informasiUsaha?.businessName ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Jenis Komoditas',
            vm.setStringResponse(
              vm.informasiUsaha?.jenisKomoditas ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Sektor Ekonomi',
            vm.setStringResponse(
              vm.informasiUsaha?.economySectorsName ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Sub Sektor Ekonomi',
            vm.setStringResponse(
              vm.informasiUsaha?.economySubSectorsName ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Tag Location Alamat',
            vm.setStringResponse(
              vm.informasiUsaha?.tagLocation?.name ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Alamat Usaha',
            vm.setStringResponse(
              vm.informasiUsaha?.detail ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Kode Pos',
            vm.setStringResponse(
              vm.informasiUsaha?.postalCode ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Provinsi',
            vm.setStringResponse(
              vm.informasiUsaha?.province ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Kota/Kabupaten',
            vm.setStringResponse(
              vm.informasiUsaha?.city ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Kecamatan',
            vm.setStringResponse(
              vm.informasiUsaha?.district ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Kelurahan',
            vm.setStringResponse(
              vm.informasiUsaha?.village ?? '-',
            ),
          ),
          PariLabelAndValue(
            'RT',
            vm.setStringResponse(
              vm.informasiUsaha?.rt ?? '-',
            ),
          ),
          PariLabelAndValue(
            'RW',
            vm.setStringResponse(
              vm.informasiUsaha?.rw ?? '-',
            ),
          ),
        ],
      ),
    );
  }
}
