import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../shared/ritel_foto_kunjungan_item.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_viewmodel_pari.dart';
import 'pari_label_and_value.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class PariDataLainnyaDetails
    extends HookViewModelWidget<PipelineDetailsViewModelPari> {
  const PariDataLainnyaDetails({
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
        _buildInfoLainnyaSection(viewModel),
      ],
    );
  }

  Padding _buildInfoLainnyaSection(PipelineDetailsViewModelPari vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PariLabelAndValue(
            'CB Terdekat',
            vm.setStringResponse(
              vm.informasiLainnya?.cbName ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Waktu Tempuh Lokasi',
            (vm.informasiLainnya?.etaToCB != null &&
                    (vm.informasiLainnya?.etaToCB?.isNotEmpty ?? false))
                ? '${vm.informasiLainnya?.etaToCB ?? '-'} Menit'
                : '-',
          ),
          PariLabelAndValue(
            'Rating PARI',
            vm.setStringResponse(
              vm.informasiLainnya?.ratingPARI ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Frekuensi Transaksi di PARI',
            vm.setStringResponse(
              vm.informasiLainnya?.transactionFrequency ?? '-',
            ),
          ),
          PariLabelAndValue(
            'Jenis Produk Pinjaman',
            vm.informasiLainnya != null
                ? vm.informasiLainnya?.loan_typesId == '1'
                    ? 'Pinang Maksima - KMK PTR'
                    : 'Pinang Maksima - KMK PRK Pinang PARI'
                : '-',
          ),
          PariLabelAndValue(
            'Estimasi Nominal Plafond',
            (vm.informasiLainnya?.loanAmount ?? '').isNotEmpty
                ? 'Rp. ${formatter.format(
                    double.parse(vm.informasiLainnya?.loanAmount ?? ''),
                  )}'
                : '-',
          ),
          PariLabelAndValue(
            'Tanggal Kunjungan',
            vm.informasiLainnya?.dateOfVisit != null
                ? DateStringFormatter.forOutputRitel(
                    vm.informasiLainnya?.dateOfVisit ?? '',
                  )
                : '-',
          ),
          PariLabelAndValue(
            'Tag Location Kunjungan',
            vm.setStringResponse(
              vm.informasiLainnya?.tagLocation?.name ?? '-',
            ),
          ),
          _buildFotoKunjunganSection(vm),
          PariLabelAndValue(
            'Hasil LKN',
            vm.setStringResponse(
              vm.informasiLainnya?.visitResult ?? '-',
            ),
          ),
        ],
      ),
    );
  }

  // ignore: long-method
  Padding _buildFotoKunjunganSection(PipelineDetailsViewModelPari vm) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.w, 15.h, 0.w, 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Foto Kunjungan',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff828896),
              fontWeight: FontWeight.w600,
            ),
          ),
          if (vm.checkFotoKunjunganDua)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![0]['meta']['photoName'],
                  vm.fotoKunjunganSatu,
                  vm.informasiLainnya!.visitPath![0]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![1]['meta']['photoName'],
                  vm.fotoKunjunganDua,
                  vm.informasiLainnya!.visitPath![1]['meta']['locationDetail'],
                ),
              ],
            )
          else if (vm.checkFotoKunjunganTiga)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![0]['meta']['photoName'],
                  vm.fotoKunjunganSatu,
                  vm.informasiLainnya!.visitPath![0]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![1]['meta']['photoName'],
                  vm.fotoKunjunganDua,
                  vm.informasiLainnya!.visitPath![1]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![2]['meta']['photoName'],
                  vm.fotoKunjunganTiga,
                  vm.informasiLainnya!.visitPath![2]['meta']['locationDetail'],
                ),
              ],
            )
          else if (vm.checkFotoKunjunganEmpat)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![0]['meta']['photoName'],
                  vm.fotoKunjunganSatu,
                  vm.informasiLainnya!.visitPath![0]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![1]['meta']['photoName'],
                  vm.fotoKunjunganDua,
                  vm.informasiLainnya!.visitPath![1]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![2]['meta']['photoName'],
                  vm.fotoKunjunganTiga,
                  vm.informasiLainnya!.visitPath![2]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![3]['meta']['photoName'],
                  vm.fotoKunjunganEmpat,
                  vm.informasiLainnya!.visitPath![3]['meta']['locationDetail'],
                ),
              ],
            )
          else if (vm.checkFotoKunjunganLima)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![0]['meta']['photoName'],
                  vm.fotoKunjunganSatu,
                  vm.informasiLainnya!.visitPath![0]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![1]['meta']['photoName'],
                  vm.fotoKunjunganDua,
                  vm.informasiLainnya!.visitPath![1]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![2]['meta']['photoName'],
                  vm.fotoKunjunganTiga,
                  vm.informasiLainnya!.visitPath![2]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![3]['meta']['photoName'],
                  vm.fotoKunjunganEmpat,
                  vm.informasiLainnya!.visitPath![3]['meta']['locationDetail'],
                ),
                RitelFotoKunjunganItem(
                  vm.informasiLainnya!.visitPath![4]['meta']['photoName'],
                  vm.fotoKunjunganLima,
                  vm.informasiLainnya!.visitPath![4]['meta']['locationDetail'],
                ),
              ],
            )
          else
            const Text(
              '-',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff162B3A),
              ),
            ),
        ],
      ),
    );
  }
}
