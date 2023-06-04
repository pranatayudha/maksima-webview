import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../../../../../application/models/ritel_mutasi_rekening.dart';
import '../../../../../../../../../shared/thick_light_grey_divider.dart';
import '../mutasi_rekening_pari_viewmodel.dart';
import 'ritel_file_item_mutasi.dart';

class MutasiRekeningDetailsItemPari extends StatelessWidget {
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;
  final DetailMutasi detailMutasi;

  const MutasiRekeningDetailsItemPari({
    Key? key,
    required this.detailMutasi,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    required this.prakarsaId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MutasiRekeningPariViewModel>.reactive(
      viewModelBuilder: () => MutasiRekeningPariViewModel(
        prakarsaId: prakarsaId,
        status: status,
        pipelineId: pipelineId,
        loanTypesId: loanTypesId,
        detailMutasi: detailMutasi,
        codeTable: codeTable,
      ),
      builder: (context, vm, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleAndSubtitle(
                    'Periode',
                    detailMutasi.periodeAwal != null
                        ? '${detailMutasi.periodeAwal!} - ${detailMutasi.periodeAkhir}'
                        : '-',
                  ),
                  SizedBox(height: 8.h),
                  _buildTitleAndSubtitle(
                    'Saldo Awal',
                    detailMutasi.saldoAwal != null
                        ? vm.thousandSeparator(detailMutasi.saldoAwal!)
                        : '-',
                  ),
                  SizedBox(height: 8.h),
                  _buildTitleAndSubtitle(
                    'Total Mutasi Debet',
                    detailMutasi.totalMutasiDebet != null
                        ? vm.thousandSeparator(
                            detailMutasi.totalMutasiDebet!,
                          )
                        : '-',
                  ),
                  SizedBox(height: 8.h),
                  _buildTitleAndSubtitle(
                    'Total Mutasi Kredit',
                    detailMutasi.totalMutasiKredit != null
                        ? vm.thousandSeparator(
                            detailMutasi.totalMutasiKredit!,
                          )
                        : '-',
                  ),
                  SizedBox(height: 8.h),
                  _buildTitleAndSubtitle(
                    'Total Akhir Tiap Bulan',
                    detailMutasi.totalAkhirTiapBulan != null
                        ? vm.thousandSeparator(
                            detailMutasi.totalAkhirTiapBulan!,
                          )
                        : '-',
                  ),
                  SizedBox(height: 8.h),
                  if (vm.pathBuktiMutasi == null)
                    const Center(child: CircularProgressIndicator())
                  else
                    RitelFileItemMutasi(vm.pathBuktiMutasi!),
                ],
              ),
            ),
            const ThickLightGreyDivider(),
          ],
        );
      },
    );
  }
}

Row _buildTitleAndSubtitle(String title, String subtitle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xff828896),
        ),
      ),
      Text(
        subtitle,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xff162B3A),
        ),
      ),
    ],
  );
}
