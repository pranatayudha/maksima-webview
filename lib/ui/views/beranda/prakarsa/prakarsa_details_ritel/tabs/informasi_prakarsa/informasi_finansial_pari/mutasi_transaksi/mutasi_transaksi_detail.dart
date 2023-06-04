import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../../../../application/app/app.locator.dart';
import '../../../../../../../../../application/app/app.router.dart';
import '../../../../../../../../../application/app/constants/icon_constants.dart';
import '../../../../../../../../../application/models/ritel_mutasi_transaksi_pari.dart';
import '../../../../../../../../../application/services/url_launcher_service.dart';
import '../../../../../../../../shared/network_sensitive.dart';
import '../../../../../../../../shared/styles.dart';
import '../../../../../../../../shared/thick_light_grey_divider.dart';
import 'mutasi_transaksi_viewmodel.dart';

class MutasiTransaksiDetail extends StatefulWidget {
  final RitelMutasiTransaksiPariModel ritelMutasiTransaksiPariModel;
  final String pipelineId;
  final int loanTypesId;
  final int status;
  final int codeTable;

  const MutasiTransaksiDetail({
    Key? key,
    required this.ritelMutasiTransaksiPariModel,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  }) : super(key: key);

  @override
  State<MutasiTransaksiDetail> createState() => _MutasiTransaksiDetailState();
}

class _MutasiTransaksiDetailState extends State<MutasiTransaksiDetail> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MutasiTransaksiPariViewModel>.reactive(
      viewModelBuilder: () => MutasiTransaksiPariViewModel(
        prakarsaId:
            widget.ritelMutasiTransaksiPariModel.data!.transaksi!.prakarsaId!,
        pipelineId: widget.pipelineId,
        loanTypesId: widget.loanTypesId,
        status: widget.status,
        codeTable: widget.codeTable,
      ),
      builder: (context, vm, child) {
        final formatter = NumberFormat('#,###', 'id_ID');
        // ignore: newline-before-return
        return NetworkSensitive(
          child: WillPopScope(
            onWillPop: () async {
              locator<NavigationService>().navigateTo(
                Routes.informasiFinansialViewPari,
                arguments: InformasiFinansialViewPariArguments(
                  prakarsaId: widget.ritelMutasiTransaksiPariModel.data!
                      .transaksi!.prakarsaId!,
                  pipelineId: widget.pipelineId,
                  loanTypesId: widget.loanTypesId,
                  status: widget.status,
                  codeTable: widget.codeTable,
                ),
              );

              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  'Mutasi Transaksi di PARI',
                  style: tsHeading6,
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                centerTitle: true,
                leading: GestureDetector(
                  onTap: () => locator<NavigationService>().navigateTo(
                    Routes.informasiFinansialViewPari,
                    arguments: InformasiFinansialViewPariArguments(
                      prakarsaId: widget.ritelMutasiTransaksiPariModel.data!
                          .transaksi!.prakarsaId!,
                      pipelineId: widget.pipelineId,
                      loanTypesId: widget.loanTypesId,
                      status: widget.status,
                      codeTable: widget.codeTable,
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 24.sp,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () => locator<NavigationService>().navigateTo(
                      Routes.mutasiTransaksiPariView,
                      arguments: MutasiTransaksiPariViewArguments(
                        prakarsaId: widget.ritelMutasiTransaksiPariModel.data!
                            .transaksi!.prakarsaId!,
                        ritelMutasiTransaksiPariModel:
                            widget.ritelMutasiTransaksiPariModel,
                        fileMutasiTransaksiPari: vm.fileMutasiTransaksi,
                        pipelineId: widget.pipelineId,
                        loanTypesId: widget.loanTypesId,
                        status: widget.status,
                        codeTable: widget.codeTable,
                      ),
                    ),
                    child: Image.asset(
                      IconConstants.edit,
                      scale: 3,
                    ),
                  ),
                ],
              ),
              body: Container(
                color: Colors.white,
                child: SafeArea(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.33,
                          horizontal: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconConstants.xls,
                              scale: 3,
                            ),
                            const SizedBox(width: 22.67),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  'Mutasi Transaksi',
                                  style: const TextStyle(
                                    color: Color(0xff03213E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                GestureDetector(
                                  // ignore: no-empty-block
                                  onTap: () async {
                                    locator<URLLauncherService>().browse(
                                      await vm.getPublicFile(widget
                                          .ritelMutasiTransaksiPariModel
                                          .data!
                                          .transaksi!
                                          .pathUrl!),
                                    );
                                    // vm.downloadMutasiTransaksiTemplate(
                                    //   widget.ritelMutasiTransaksiPariModel.data!
                                    //       .transaksi!.pathUrl!,
                                    // );
                                  },
                                  child: const Text(
                                    'Lihat',
                                    style: TextStyle(
                                      color: Color(0xff1BB0DF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const ThickLightGreyDivider(),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSubTitle('RINGKASAN PARI'),
                            _buildTitleAndSubtitle(
                              'GRADE PARI',
                              widget.ritelMutasiTransaksiPariModel.data!
                                  .transaksi!.gradePari,
                              const Color(0xffF07126),
                            ),
                            _buildTitleAndSubtitle(
                              'Total Frekuensi',
                              '${widget.ritelMutasiTransaksiPariModel.data!.transaksi!.totalFrekuensi.toString()} Transaksi',
                              const Color(0xff162B3A),
                            ),
                            _buildTitleAndSubtitle(
                              'Total Nominal Transaksi',
                              'Rp. ${formatter.format(double.parse(widget.ritelMutasiTransaksiPariModel.data!.transaksi!.totalNominalFrekuensi!).toInt())}',
                              const Color(0xff162B3A),
                            ),
                            _buildTitleAndSubtitle(
                              'Rata-Rata Nominal Transaksi',
                              'Rp. ${formatter.format(double.parse(widget.ritelMutasiTransaksiPariModel.data!.transaksi!.nilaiRataProject!).toInt())}',
                              const Color(0xff162B3A),
                            ),
                            _buildTitleAndSubtitle(
                              'Nilai Tertinggi Transaksi',
                              'Rp. ${formatter.format(double.parse(widget.ritelMutasiTransaksiPariModel.data!.transaksi!.nilaiProjectTertinggi!).toInt())}',
                              const Color(0xff162B3A),
                            ),
                          ],
                        ),
                      ),
                      const ThickLightGreyDivider(),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSubTitle('RINGKASAN TRANSAKSI'),
                            if (widget.ritelMutasiTransaksiPariModel.data!
                                    .transaksi!.dataRiwayat !=
                                null)
                              for (var i = 0;
                                  i <
                                      widget.ritelMutasiTransaksiPariModel.data!
                                          .transaksi!.dataRiwayat!.length;
                                  i++)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xffCDD3D8),
                                    ),
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Column(
                                    children: [
                                      _buildTitleAndSubtitle(
                                        'Tanggal Transaksi',
                                        widget
                                            .ritelMutasiTransaksiPariModel
                                            .data!
                                            .transaksi!
                                            .dataRiwayat![i]
                                            .transactionDate,
                                        const Color(0xff162B3A),
                                      ),
                                      _buildTitleAndSubtitle(
                                        'No. Invoice',
                                        widget
                                            .ritelMutasiTransaksiPariModel
                                            .data!
                                            .transaksi!
                                            .dataRiwayat![i]
                                            .invoiceNum,
                                        const Color(0xff162B3A),
                                      ),
                                      _buildTitleAndSubtitle(
                                        'Nama Debitur',
                                        widget
                                            .ritelMutasiTransaksiPariModel
                                            .data!
                                            .transaksi!
                                            .dataRiwayat![i]
                                            .nameDebitur,
                                        const Color(0xff162B3A),
                                      ),
                                      _buildTitleAndSubtitle(
                                        'Nama Supplier',
                                        widget
                                            .ritelMutasiTransaksiPariModel
                                            .data!
                                            .transaksi!
                                            .dataRiwayat![i]
                                            .nameSupplier,
                                        const Color(0xff162B3A),
                                      ),
                                      _buildTitleAndSubtitle(
                                        'Nominal Transaksi',
                                        'Rp. ${formatter.format(double.parse(widget.ritelMutasiTransaksiPariModel.data!.transaksi!.dataRiwayat![i].nominalTransaksi!).toInt())}',
                                        const Color(0xff38BAA7),
                                      ),
                                      // _buildTitleAndSubtitle(
                                      //   'Metode Pembayaran',
                                      //   widget.ritelMutasiTransaksiPariModel.data!
                                      //       .transaksi!.dataRiwayat![i].metodePembayaran,
                                      //   const Color(0xff162B3A),
                                      // ),
                                      // _buildTitleAndSubtitle(
                                      //   'Status PAID/NOT',
                                      //   widget.ritelMutasiTransaksiPariModel.data!
                                      //       .transaksi!.dataRiwayat![i].,
                                      //   const Color(0xff38BAA7),
                                      // ),
                                    ],
                                  ),
                                ),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Padding _buildSubTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 16.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xff03213E),
        ),
      ),
    );
  }

  Padding _buildTitleAndSubtitle(
    String title,
    dynamic subtitle,
    dynamic color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff828896),
            ),
          ),
          Text(
            subtitle ?? '-',
            style: TextStyle(
              fontSize: 14.sp,
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
