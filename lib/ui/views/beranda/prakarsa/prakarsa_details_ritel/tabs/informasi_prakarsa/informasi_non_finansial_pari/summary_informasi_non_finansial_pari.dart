import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../application/models/ritel_summary_non_finansial.dart';
import '../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../shared/styles.dart';
import '../../../../../../../shared/thick_light_grey_divider.dart';

class SummaryInformasiNonFinansialPari extends StatelessWidget {
  final String fullName;
  final RitelSummaryNonFinansial summaryNonFinansial;
  final String prakarsaId;
  final String pipelineId;
  final int loanTypesId;
  final int codeTable;

  const SummaryInformasiNonFinansialPari({
    Key? key,
    required this.fullName,
    required this.summaryNonFinansial,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () async {
          locator<NavigationService>().navigateTo(
            Routes.prakarsaDetailsViewRitel,
            arguments: PrakarsaDetailsViewRitelArguments(
              index: 1,
              prakarsaId: prakarsaId,
              pipelineId: pipelineId,
              loanTypesId: loanTypesId,
              codeTable: 4,
            ),
          );
          // ignore: newline-before-return
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            centerTitle: true,
            shadowColor: Colors.transparent,
            title: Text(
              'Summary - $fullName',
              style: tsHeading6,
            ),
            leadingWidth: 30.w,
            leading: Container(
              margin: EdgeInsets.only(left: 5.w),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: const Color(0xff606060),
                  size: 24.sp,
                ),
                onPressed: () => locator<NavigationService>().navigateTo(
                  Routes.prakarsaDetailsViewRitel,
                  arguments: PrakarsaDetailsViewRitelArguments(
                    index: 1,
                    prakarsaId: prakarsaId,
                    pipelineId: pipelineId,
                    loanTypesId: loanTypesId,
                    codeTable: 4,
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 28.w, 16.h),
                      child: Text(
                        'Berikut adalah hasil yang didapatkan dari input non finansial:',
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                    //   child: SizedBox(
                    //     width: 328.w,
                    //     height: 80.h,
                    //     child: Card(
                    //         color: const Color(0xffF6F6F8),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               'Total Non Finansial',
                    //               style: tsHeading12,
                    //               textAlign: TextAlign.center,
                    //             ),
                    //             SizedBox(height: 5.h),
                    //             Text(
                    //               '600',
                    //               style: tsHeadingSecondaryBlack,
                    //               textAlign: TextAlign.center,
                    //             ),
                    //           ],
                    //         )),
                    //   ),
                    // ),
                    const ThickLightGreyDivider(),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1. Karakter',
                            style: tsHeading10,
                          ),
                          SizedBox(height: 16.h),
                          _buildRingkasanFasilitasItem(
                            'Tingkat Kepercayaan',
                            summaryNonFinansial
                                .karakter!.tingkatKepercayaan!.resultIndex
                                .toString(),
                          ),
                          _buildRingkasanFasilitasItem(
                            'Pengelolaan Rekening Bank',
                            summaryNonFinansial
                                .karakter!.pengelolaanRekeningBank!.resultIndex
                                .toString(),
                          ),
                          _buildRingkasanFasilitasItem(
                            'Reputasi Bisnis',
                            summaryNonFinansial
                                .karakter!.reputasiBisnis!.resultIndex
                                .toString(),
                          ),
                          _buildRingkasanFasilitasItem(
                            'Perilaku Pribadi Debitur',
                            summaryNonFinansial
                                .karakter!.perilakuPribadiDebitur!.resultIndex
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                    const ThickLightGreyDivider(),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2. Posisi Pasar',
                            style: tsHeading10,
                          ),
                          SizedBox(height: 16.h),
                          _buildRingkasanFasilitasItem(
                            'Kualitas Produk/Jasa',
                            summaryNonFinansial
                                .posisiPasar!.kualitasProduk!.resultIndex
                                .toString(),
                          ),
                          _buildRingkasanFasilitasItem(
                            'Strategi dan Ketergantungan',
                            summaryNonFinansial.posisiPasar!
                                .strategiKetergantungan!.resultIndex
                                .toString(),
                          ),
                          _buildRingkasanFasilitasItem(
                            'Lokasi Usaha',
                            summaryNonFinansial
                                .posisiPasar!.lokasiUsaha!.resultIndex
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                    const ThickLightGreyDivider(),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3. Situasi Persaingan',
                            style: tsHeading10,
                          ),
                          SizedBox(height: 16.h),
                          _buildRingkasanFasilitasItem(
                            'Perkembangan pasar, peluang mendapatkan laba dan persaingan',
                            summaryNonFinansial.situasiPersaingan!
                                .perkembanganPasar!.resultIndex
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                    const ThickLightGreyDivider(),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '4. Manajemen',
                            style: tsHeading10,
                          ),
                          SizedBox(height: 16.h),
                          _buildRingkasanFasilitasItem(
                            'Kualifikasi Komersial',
                            summaryNonFinansial
                                .manajemen!.kualifikasiKomersial!.resultIndex
                                .toString(),
                          ),
                          _buildRingkasanFasilitasItem(
                            'Kualifikasi Teknis',
                            summaryNonFinansial
                                .manajemen!.kualifikasiTeknis!.resultIndex
                                .toString(),
                          ),
                          _buildRingkasanFasilitasItem(
                            'Struktur Internal Perusahaan',
                            summaryNonFinansial.manajemen!
                                .sturukturInternalPerusahaan!.resultIndex
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                    const ThickLightGreyDivider(),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '5. Prospek Industri',
                            style: tsHeading10,
                          ),
                          SizedBox(height: 16.h),
                          _buildRingkasanFasilitasItem(
                            'Prospek Industri',
                            summaryNonFinansial
                                .prospekIndustri!.prospekIndustri2!.resultIndex
                                .toString(),
                          ),
                        ],
                      ),
                    ),
                    const ThickLightGreyDivider(),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '6. Jaminan',
                            style: tsHeading10,
                          ),
                          SizedBox(height: 16.h),
                          _buildRingkasanFasilitasItem(
                            'Coverage Agunan',
                            summaryNonFinansial
                                .jaminan!.coverageAgunan!.resultIndex
                                .toString(),
                          ),
                          _buildRingkasanFasilitasItem(
                            'Hubungan Kepemilikan Agunan dengan Debitur',
                            summaryNonFinansial
                                .jaminan!.hubunganKepemilikanAgunan!.resultIndex
                                .toString(),
                          ),
                          _buildRingkasanFasilitasItem(
                            'Marketabilitas Agunan',
                            summaryNonFinansial
                                .jaminan!.marketabiitasAgunan!.resultIndex
                                .toString(),
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
      ),
    );
  }

  // component list jawaban
  Column _buildRingkasanFasilitasItem(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 310.w, // Harus dibuat dynamic
              child: Text(
                label,
                style: tsDarkGrey,
                maxLines: 3,
              ),
            ),
            Text(value, style: tsHeading10Black80),
          ],
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
