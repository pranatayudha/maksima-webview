import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../../application/app/constants/custom_color.dart';
import '../../../../../../application/app/constants/image_constants.dart';
import '../../../../../../application/models/monitoring_detail.dart';
import '../../../../../shared/styles.dart';
import '../../monitoring_detail/widgets/label_and_value.dart';
import '../monitoring_detail_viewmodel.dart';
import 'pinjaman_card.dart';

@immutable
class DataPinjamanBody extends HookViewModelWidget<MonitoringDetailViewModel> {
  final MonitoringDetail? monitoringDetail;

  DataPinjamanBody({Key? key, required this.monitoringDetail})
      : super(key: key);

  final formatter = NumberFormat(
    'Rp#,###',
    'id_ID',
  );

  @override
  // ignore: long-method
  Widget buildViewModelWidget(
    context,
    MonitoringDetailViewModel viewModel,
  ) {
    final header = monitoringDetail?.header;
    final summaryPinjaman = monitoringDetail?.summaryPinjaman;
    final listPinjaman = monitoringDetail?.pinjaman?.where((element) {
      if (viewModel.currentPinjamanFilter == PinjamanFilter.aktif) {
        return element.statusDisburse?.toLowerCase() == 'aktif';
      }

      if (viewModel.currentPinjamanFilter == PinjamanFilter.lunas) {
        return element.statusDisburse?.toLowerCase() == 'lunas';
      }

      return true;
    }).toList();

    final semuaListPinjamanLength = monitoringDetail?.pinjaman?.length;
    final aktifListPinjamanLength = monitoringDetail?.pinjaman
        ?.where((element) => element.statusDisburse?.toLowerCase() == 'aktif')
        .length;
    final lunasListPinjamanLength = monitoringDetail?.pinjaman
        ?.where((element) => element.statusDisburse?.toLowerCase() == 'lunas')
        .length;

    return Container(
      color: Colors.grey.shade100,
      child: CustomScrollView(
        key: const PageStorageKey<String>('pinjaman'),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
              context,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                  child: Column(
                    children: [
                      // StatusSaatIni(remainingDueDateDays),
                      LabelAndValue(
                        'Plafond Fasilitas:',
                        summaryPinjaman?.plafond == null
                            ? '-'
                            : formatter.format(
                                double.tryParse(summaryPinjaman!.plafond!),
                              ),
                      ),
                      LabelAndValue(
                        'Total Outstanding:',
                        summaryPinjaman?.outstanding == null
                            ? '-'
                            : formatter.format(
                                double.tryParse(summaryPinjaman!.outstanding!),
                              ),
                      ),
                      LabelAndValue(
                        'Kelonggaran Tarik:',
                        summaryPinjaman?.kelonggaranTarik == null
                            ? '-'
                            : formatter.format(
                                summaryPinjaman!.kelonggaranTarik!.toDouble(),
                              ),
                      ),
                      LabelAndValue(
                        'Tunggakan Bunga:',
                        summaryPinjaman?.tunggakanBunga == null
                            ? '-'
                            : formatter.format(
                                double.parse(summaryPinjaman!.tunggakanBunga!),
                              ),
                      ),
                      LabelAndValue(
                        'Biaya Denda:',
                        summaryPinjaman?.biayaDenda == null
                            ? '-'
                            : formatter.format(
                                double.parse(summaryPinjaman!.biayaDenda!),
                              ),
                      ),
                      LabelAndValue(
                        'Total Kewajiban:',
                        summaryPinjaman?.totalKewajiban == null
                            ? '-'
                            : formatter.format(
                                double.parse(summaryPinjaman!.totalKewajiban!),
                              ),
                      ),
                      LabelAndValue(
                        'Kolektabilitas:',
                        summaryPinjaman?.kolektabilitas ?? '-',
                      ),
                      LabelAndValue(
                        'Total Cadangan Bunga:',
                        summaryPinjaman?.totalCadanganBunga == null
                            ? '-'
                            : formatter.format(
                                double.parse(
                                  summaryPinjaman!.totalCadanganBunga!,
                                ),
                              ),
                      ),
                      LabelAndValue(
                        'Accrue Bunga:',
                        summaryPinjaman?.accrue == null
                            ? '-'
                            : formatter.format(
                                double.parse(summaryPinjaman!.accrue!),
                              ),
                      ),
                      LabelAndValue(
                        'Bunga Pinjaman:',
                        header?.bungaPinjaman != null
                            ? '${header!.bungaPinjaman!}%'
                            : '-',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1.w,
                            color: CustomColor.darkGrey,
                          ),
                        ),
                        padding: EdgeInsets.all(16.w),
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LabelAndValue(
                              'No. Fasilitas',
                              summaryPinjaman!.numFasilitas ?? '-',
                            ),
                            LabelAndValue(
                              'No. Rek Simpanan',
                              summaryPinjaman.numRekSimpanan ?? '-',
                            ),
                            LabelAndValue(
                              'No. Rek Escrow',
                              summaryPinjaman.numRekEscrow ?? '-',
                            ),
                            LabelAndValue(
                              'No. Rek Pinjaman',
                              summaryPinjaman.numRekPinjaman ?? '-',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey.shade100,
              // margin: EdgeInsets.symmetric(vertical: 8.h),
              // padding: EdgeInsets.all(16.w),
              height: 80.w,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(16.w),
                children: [
                  ChoiceChip(
                    selectedColor: CustomColor.secondaryBlue,
                    backgroundColor: CustomColor.secondaryBlue10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(
                        color: CustomColor.secondaryBlue,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    selected: viewModel.currentPinjamanFilter ==
                        PinjamanFilter.semua,
                    onSelected: (isSelected) {
                      if (isSelected) {
                        viewModel.changePinjamanListFilter(
                          PinjamanFilter.semua,
                        );
                      }
                    },
                    label: Text(
                      'Semua (${semuaListPinjamanLength ?? 0})',
                      style: viewModel.currentPinjamanFilter ==
                              PinjamanFilter.semua
                          ? tsBody6White.copyWith(
                              fontWeight: FontWeight.w600,
                            )
                          : tsHeading11.copyWith(
                              color: CustomColor.primaryBlue,
                            ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  ChoiceChip(
                    selectedColor: CustomColor.secondaryBlue,
                    backgroundColor: CustomColor.secondaryBlue10,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(
                        color: CustomColor.secondaryBlue,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    selected: viewModel.currentPinjamanFilter ==
                        PinjamanFilter.aktif,
                    onSelected: (isSelected) {
                      if (isSelected) {
                        viewModel.changePinjamanListFilter(
                          PinjamanFilter.aktif,
                        );
                      }
                    },
                    label: Text(
                      'Aktif (${aktifListPinjamanLength ?? 0})',
                      style: viewModel.currentPinjamanFilter ==
                              PinjamanFilter.aktif
                          ? tsBody6White.copyWith(
                              fontWeight: FontWeight.w600,
                            )
                          : tsHeading11.copyWith(
                              color: CustomColor.primaryBlue,
                            ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  ChoiceChip(
                    selectedColor: CustomColor.secondaryBlue,
                    backgroundColor: CustomColor.secondaryBlue10,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: const BorderSide(
                        color: CustomColor.secondaryBlue,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    selected: viewModel.currentPinjamanFilter ==
                        PinjamanFilter.lunas,
                    onSelected: (isSelected) {
                      if (isSelected) {
                        viewModel.changePinjamanListFilter(
                          PinjamanFilter.lunas,
                        );
                      }
                    },
                    label: Text(
                      'Lunas (${lunasListPinjamanLength ?? 0})',
                      style: viewModel.currentPinjamanFilter ==
                              PinjamanFilter.lunas
                          ? tsBody6White.copyWith(
                              fontWeight: FontWeight.w600,
                            )
                          : tsHeading11.copyWith(
                              color: CustomColor.primaryBlue,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if ((listPinjaman ?? []).isEmpty)
            SliverToBoxAdapter(child: _buildPinjamanListEmpty())
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: listPinjaman!.length,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: PinjamanCard(
                      pinjamanCounter: index,
                      pinjaman: listPinjaman[index],
                      onTap: () {
                        if ((listPinjaman[index].statusDisburse ?? '')
                            .isNotEmpty) {
                          final status =
                              listPinjaman[index].statusDisburse?.toLowerCase();
                          // if (status == 'ditolak' || status == 'harus revisi') {
                          if (listPinjaman[index].idPinjaman != null) {
                            viewModel.navigateToPinjamanDetail(
                              index,
                              listPinjaman[index].idPinjaman!,
                              status!,
                            );
                          }
                          // }
                        }
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPinjamanListEmpty() {
    return SizedBox(
      height: 256.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.pipelineEmpty, scale: 3),
          const SizedBox(height: 32),
          Text(
            'Belum ada aktivitas pencairan dari debitur ini.\nTambah pencairan',
            style: tsBody6,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
