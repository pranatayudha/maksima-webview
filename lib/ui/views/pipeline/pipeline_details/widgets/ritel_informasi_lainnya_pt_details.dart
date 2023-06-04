import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/helpers/date_string_formatter.dart';
import '../../../../shared/ritel_foto_kunjungan_item.dart';
import '../../../../shared/thick_light_grey_divider.dart';
import '../pipeline_details_perusahaan_pt_viewmodel_ritel.dart';
import 'ritel_label_and_value.dart';

final formatter = NumberFormat('#,###', 'id_ID');

class RitelInformasiLainnyaPtDetails
    extends HookViewModelWidget<PipelineDetailsPerusahaanPtViewModelRitel> {
  const RitelInformasiLainnyaPtDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PipelineDetailsPerusahaanPtViewModelRitel viewModel,
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
    PipelineDetailsPerusahaanPtViewModelRitel vm,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RitelLabelAndValue(
            'CB Terdekat',
            vm.informasiLainnya != null ? vm.informasiLainnya!.cbName! : '-',
          ),
          RitelLabelAndValue(
            'Waktu Tempuh Lokasi',
            vm.informasiLainnya != null
                ? vm.informasiLainnya!.etaToCB!.isNotEmpty
                    ? '${vm.informasiLainnya!.etaToCB!} Menit'
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Jenis Produk Pinjaman',
            vm.informasiLainnya != null
                ? vm.informasiLainnya!.loan_typesId! == '1'
                    ? 'Pinang Maksima - KMK PTR'
                    : 'Pinang Maksima - KMK PRK Pinang PARI'
                : '-',
          ),
          RitelLabelAndValue(
            'Estimasi Nominal Plafond',
            vm.informasiLainnya != null
                ? 'Rp. ${formatter.format(double.parse(vm.informasiLainnya!.loanAmount!))}'
                : '-',
          ),
          RitelLabelAndValue(
            'Tanggal Kunjungan',
            vm.informasiLainnya != null
                ? vm.informasiLainnya!.dateOfVisit != null
                    ? DateStringFormatter.forOutputRitel(
                        vm.informasiLainnya!.dateOfVisit!,
                      )
                    : '-'
                : '-',
          ),
          RitelLabelAndValue(
            'Tag Location Kunjungan',
            vm.informasiLainnya != null
                ? vm.informasiLainnya!.tagLocation!.name!.isNotEmpty
                    ? vm.informasiLainnya!.tagLocation!.name!
                    : '-'
                : '-',
          ),
          _buildFotoKunjunganSection(vm),
          RitelLabelAndValue(
            'Hasil LKN',
            vm.informasiLainnya != null
                ? vm.informasiLainnya!.visitResult!.isNotEmpty
                    ? vm.informasiLainnya!.visitResult!
                    : '-'
                : '-',
          ),
        ],
      ),
    );
  }

  // ignore: long-method
  Padding _buildFotoKunjunganSection(
    PipelineDetailsPerusahaanPtViewModelRitel vm,
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
              color: Color(0xff828896),
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

  Column _buildFotoKunjunganHaveFive(
    PipelineDetailsPerusahaanPtViewModelRitel vm,
  ) {
    return Column(
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
    );
  }

  Column _buildFotoKunjunganHaveFour(
    PipelineDetailsPerusahaanPtViewModelRitel vm,
  ) {
    return Column(
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
    );
  }

  Column _buildFotoKunjunganHaveThree(
    PipelineDetailsPerusahaanPtViewModelRitel vm,
  ) {
    return Column(
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
    );
  }

  Column _buildFotoKunjunganHaveTwo(
    PipelineDetailsPerusahaanPtViewModelRitel vm,
  ) {
    return Column(
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
    );
  }

  Column _buildFotoKunjunganOnlyOne(
    PipelineDetailsPerusahaanPtViewModelRitel vm,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18.h),
        RitelFotoKunjunganItem(
          vm.informasiLainnya!.visitPath![0]['meta']['photoName'],
          vm.fotoKunjunganSatu,
          vm.informasiLainnya!.visitPath![0]['meta']['locationDetail'],
        ),
      ],
    );
  }
}
