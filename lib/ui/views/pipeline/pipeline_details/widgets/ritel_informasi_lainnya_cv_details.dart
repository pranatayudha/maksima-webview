import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../shared/ritel_foto_item.dart';
import '../../../../shared/ritel_foto_kunjungan_item.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_perusahaan_cv_viewmodel_ritel.dart';
import 'ritel_label_and_value.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class RitelInformasiLainnyaCvDetails
    extends HookViewModelWidget<PipelineDetailsPerusahaanCvViewModelRitel> {
  const RitelInformasiLainnyaCvDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsPerusahaanCvViewModelRitel viewModel,
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

  Padding _buildInfoLainnyaSection(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RitelLabelAndValue(
            'CB Terdekat',
            vm.informasiLainnyaCv != null
                ? vm.informasiLainnyaCv!.cbName!
                : '-',
          ),
          RitelLabelAndValue(
            'Waktu Tempuh Lokasi',
            vm.informasiLainnyaCv != null
                ? vm.informasiLainnyaCv!.etaToCB!.isNotEmpty
                    ? '${vm.informasiLainnyaCv!.etaToCB!} Menit'
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Jenis Produk Pinjaman',
            vm.informasiLainnyaCv != null
                ? vm.informasiLainnyaCv!.loan_typesId! == '1'
                    ? 'Pinang Maksima - KMK PTR'
                    : 'Pinang Maksima - KMK PRK Pinang PARI'
                : '-',
          ),
          RitelLabelAndValue(
            'Estimasi Nominal Plafond',
            vm.informasiLainnyaCv != null
                ? 'Rp. ${formatter.format(double.parse(vm.informasiLainnyaCv!.loanAmount!))}'
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal Kunjungan',
            vm.informasiLainnyaCv != null
                ? vm.informasiLainnyaCv!.dateOfVisit != null
                    ? DateStringFormatter.forOutputRitel(
                        vm.informasiLainnyaCv!.dateOfVisit!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Tag Location Kunjungan',
            vm.informasiLainnyaCv != null
                ? vm.informasiLainnyaCv!.tagLocation!.name!.isNotEmpty
                    ? vm.informasiLainnyaCv!.tagLocation!.name!
                    : '-'
                : '-',
          ),
          _buildFotoKunjunganSection(vm),
          RitelLabelAndValue(
            'Hasil LKN',
            vm.informasiLainnyaCv != null
                ? vm.informasiLainnyaCv!.visitResult!.isNotEmpty
                    ? vm.informasiLainnyaCv!.visitResult!
                    : '-'
                : '-',
          ),
        ],
      ),
    );
  }

  // ignore: long-method
  Padding _buildFotoKunjunganSection(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.w, 15.h, 0.w, 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Foto Kunjungan',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff162B3A),
              fontWeight: FontWeight.w600,
            ),
          ),
          if (vm.checkFotoKunjunganSatu)
            _buildFotoKunjunganOnlyOne(vm)
          else if (vm.checkFotoKunjunganDua)
            _buildFotoKunjunganHaveTwo(vm)
          else if (vm.checkFotoKunjunganTiga)
            _buildFotoKunjunganHaveThree(vm)
          else if (vm.checkFotoKunjunganEmpat)
            _buildFotoKunjunganHaveFour(vm)
          else if (vm.checkFotoKunjunganLima)
            _buildFotoKunjunganHaveFive(vm)
          else
            Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                RitelFotoItem('Foto Kunjungan 1', null),
                RitelFotoItem('Foto Kunjungan 2', null),
              ],
            ),
          // ),
        ],
      ),
    );
  }

  Column _buildFotoKunjunganHaveFive(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18.h),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![0]['meta']['photoName'],
          vm.fotoKunjunganSatu,
          vm.informasiLainnyaCv!.visitPath![0]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![1]['meta']['photoName'],
          vm.fotoKunjunganDua,
          vm.informasiLainnyaCv!.visitPath![1]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![2]['meta']['photoName'],
          vm.fotoKunjunganTiga,
          vm.informasiLainnyaCv!.visitPath![2]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![3]['meta']['photoName'],
          vm.fotoKunjunganEmpat,
          vm.informasiLainnyaCv!.visitPath![3]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![4]['meta']['photoName'],
          vm.fotoKunjunganLima,
          vm.informasiLainnyaCv!.visitPath![4]['meta']['locationDetail'],
        ),
      ],
    );
  }

  Column _buildFotoKunjunganHaveFour(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18.h),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![0]['meta']['photoName'],
          vm.fotoKunjunganSatu,
          vm.informasiLainnyaCv!.visitPath![0]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![1]['meta']['photoName'],
          vm.fotoKunjunganDua,
          vm.informasiLainnyaCv!.visitPath![1]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![2]['meta']['photoName'],
          vm.fotoKunjunganTiga,
          vm.informasiLainnyaCv!.visitPath![2]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![3]['meta']['photoName'],
          vm.fotoKunjunganEmpat,
          vm.informasiLainnyaCv!.visitPath![3]['meta']['locationDetail'],
        ),
      ],
    );
  }

  Column _buildFotoKunjunganHaveThree(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18.h),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![0]['meta']['photoName'],
          vm.fotoKunjunganSatu,
          vm.informasiLainnyaCv!.visitPath![0]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![1]['meta']['photoName'],
          vm.fotoKunjunganDua,
          vm.informasiLainnyaCv!.visitPath![1]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![2]['meta']['photoName'],
          vm.fotoKunjunganTiga,
          vm.informasiLainnyaCv!.visitPath![2]['meta']['locationDetail'],
        ),
      ],
    );
  }

  Column _buildFotoKunjunganHaveTwo(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18.h),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![0]['meta']['photoName'],
          vm.fotoKunjunganSatu,
          vm.informasiLainnyaCv!.visitPath![0]['meta']['locationDetail'],
        ),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![1]['meta']['photoName'],
          vm.fotoKunjunganDua,
          vm.informasiLainnyaCv!.visitPath![1]['meta']['locationDetail'],
        ),
      ],
    );
  }

  Column _buildFotoKunjunganOnlyOne(
    PipelineDetailsPerusahaanCvViewModelRitel vm,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18.h),
        RitelFotoKunjunganItem(
          vm.informasiLainnyaCv!.visitPath![0]['meta']['photoName'],
          vm.fotoKunjunganSatu,
          vm.informasiLainnyaCv!.visitPath![0]['meta']['locationDetail'],
        ),
      ],
    );
  }
}
